"""
AI microservice for the Price Comparison Platform.

Run standalone on port 5001:
    pip install -r requirements.txt
    python app.py

Endpoints:
    GET  /health              -> liveness check
    POST /match                {"names": [...]}                 -> clustered product groups
    POST /predict-trend         {"history": [float, ...]}        -> price trend prediction
"""

from flask import Flask, request, jsonify
from flask_cors import CORS

from matching import cluster_product_names
from price_predictor import predict_trend

app = Flask(__name__)
CORS(app)  # allow calls from the Java backend / React dev server


@app.get("/health")
def health():
    return jsonify({"status": "ok", "service": "price-compare-ai-service"})


@app.post("/match")
def match():
    body = request.get_json(silent=True) or {}
    names = body.get("names")

    if not names or not isinstance(names, list):
        return jsonify({"error": "Request body must include a non-empty 'names' list"}), 400

    clusters = cluster_product_names(names)
    return jsonify({
        "input_count": len(names),
        "cluster_count": len(clusters),
        "clusters": clusters,
    })


@app.post("/predict-trend")
def predict():
    body = request.get_json(silent=True) or {}
    history = body.get("history")

    if history is None or not isinstance(history, list):
        return jsonify({"error": "Request body must include a 'history' list of numbers"}), 400

    try:
        history = [float(v) for v in history]
    except (TypeError, ValueError):
        return jsonify({"error": "'history' must contain only numbers"}), 400

    result = predict_trend(history)
    return jsonify(result)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001, debug=True)
