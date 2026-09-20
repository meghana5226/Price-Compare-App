const API_BASE = import.meta.env.VITE_API_BASE_URL || 'http://localhost:8080/api'

async function handleResponse(res) {
  if (!res.ok) {
    const text = await res.text().catch(() => '')
    throw new Error(`Request failed (${res.status}): ${text || res.statusText}`)
  }
  return res.json()
}

export async function fetchAllProducts() {
  const res = await fetch(`${API_BASE}/products`)
  return handleResponse(res)
}

export async function searchProducts(query) {
  const res = await fetch(`${API_BASE}/products/search?query=${encodeURIComponent(query)}`)
  return handleResponse(res)
}

export async function fetchProduct(id) {
  const res = await fetch(`${API_BASE}/products/${id}`)
  return handleResponse(res)
}

export async function fetchPriceHistory(id) {
  const res = await fetch(`${API_BASE}/products/${id}/history`)
  return handleResponse(res)
}

export async function createAlert(productId, email, targetPrice) {
  const res = await fetch(`${API_BASE}/alerts`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ productId, email, targetPrice }),
  })
  return handleResponse(res)
}

export async function predictTrend(history) {
  const res = await fetch(`${API_BASE}/ai/predict-trend`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ history }),
  })
  return handleResponse(res)
}
