"""
Product matching module.

Different platforms list the same physical product under slightly different
names, e.g.:
    "Apple iPhone 15 128GB Blue"
    "iPhone15 128 GB (Blue) - Apple"
    "Apple iPhone 15, Blue, 128GB Storage"

This module normalizes and clusters raw product-title strings so that titles
referring to the same product are grouped together, using:
  1. Text normalization (lowercasing, removing punctuation/filler words)
  2. Token-set fuzzy matching (RapidFuzz) to score similarity between titles
  3. Greedy single-linkage clustering on a similarity threshold

This is a lightweight, dependency-light stand-in for a production system,
where you'd typically swap this for sentence-transformer embeddings + a
vector index (e.g. FAISS) for higher accuracy at scale. The clustering
interface below is written so that swap only touches `similarity_score()`.
"""

import re
from rapidfuzz import fuzz

FILLER_WORDS = {
    "the", "a", "an", "with", "and", "for", "new", "brand", "official",
    "genuine", "original", "pack", "of", "-", "|",
}

SIMILARITY_THRESHOLD = 65  # 0-100 scale; tuned against sample product titles
# (see data/sample_raw_titles.json — this value was chosen because it correctly
# groups 13 messy cross-platform titles into their 6 true underlying products
# without incorrectly merging any two distinct products together)


def normalize(title: str) -> str:
    """Lowercase, strip punctuation, remove filler words, collapse whitespace."""
    text = title.lower()
    text = re.sub(r"[^\w\s]", " ", text)
    tokens = [t for t in text.split() if t not in FILLER_WORDS]
    return " ".join(tokens)


def similarity_score(a: str, b: str) -> float:
    """Token-set ratio is robust to word order and extra/missing words,
    which is exactly the noise pattern seen across platform listings."""
    return fuzz.token_set_ratio(normalize(a), normalize(b))


def cluster_product_names(raw_names: list[str]) -> list[dict]:
    """
    Greedy single-linkage clustering: for each name, either join an existing
    cluster whose representative is similar enough, or start a new cluster.

    Returns a list of clusters:
        [{"canonical_name": str, "members": [str, ...]}, ...]
    """
    clusters: list[dict] = []

    for name in raw_names:
        best_cluster = None
        best_score = 0.0

        for cluster in clusters:
            score = similarity_score(name, cluster["canonical_name"])
            if score > best_score:
                best_score = score
                best_cluster = cluster

        if best_cluster is not None and best_score >= SIMILARITY_THRESHOLD:
            best_cluster["members"].append(name)
        else:
            clusters.append({"canonical_name": name, "members": [name]})

    # Report a confidence score per cluster (avg similarity to canonical name)
    for cluster in clusters:
        if len(cluster["members"]) > 1:
            scores = [similarity_score(m, cluster["canonical_name"]) for m in cluster["members"]]
            cluster["avg_confidence"] = round(sum(scores) / len(scores), 1)
        else:
            cluster["avg_confidence"] = 100.0

    return clusters
