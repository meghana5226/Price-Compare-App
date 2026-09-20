import { useEffect, useState } from 'react'
import SearchBar from './components/SearchBar'
import ProductCard from './components/ProductCard'
import PriceTable from './components/PriceTable'
import PriceHistoryChart from './components/PriceHistoryChart'
import AlertForm from './components/AlertForm'
import PredictionPanel from './components/PredictionPanel'
import { fetchAllProducts, searchProducts, fetchProduct, fetchPriceHistory } from './api'

export default function App() {
  const [products, setProducts] = useState([])
  const [selectedId, setSelectedId] = useState(null)
  const [selectedProduct, setSelectedProduct] = useState(null)
  const [history, setHistory] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)

  useEffect(() => {
    loadAll()
  }, [])

  async function loadAll() {
    setLoading(true)
    setError(null)
    try {
      const data = await fetchAllProducts()
      setProducts(data)
    } catch (err) {
      setError(
        `Could not reach the backend API (${err.message}). Make sure the Spring Boot backend is running on port 8080.`
      )
    } finally {
      setLoading(false)
    }
  }

  async function handleSearch(query) {
    setLoading(true)
    setError(null)
    try {
      const data = await searchProducts(query)
      setProducts(data)
    } catch (err) {
      setError(`Search failed: ${err.message}`)
    } finally {
      setLoading(false)
    }
  }

  async function openProduct(id) {
    setSelectedId(id)
    setSelectedProduct(null)
    setHistory([])
    try {
      const [product, hist] = await Promise.all([fetchProduct(id), fetchPriceHistory(id)])
      setSelectedProduct(product)
      setHistory(hist)
    } catch (err) {
      setError(`Could not load product details: ${err.message}`)
    }
  }

  function goBack() {
    setSelectedId(null)
    setSelectedProduct(null)
    setHistory([])
  }

  return (
    <div className="app">
      <div className="header">
        <div>
          <div className="logo"><span className="dot" />PriceScout</div>
          <div className="tagline">AI-powered price comparison across every platform</div>
        </div>
      </div>

      {error && <div className="error-banner">{error}</div>}

      {selectedId ? (
        <ProductDetail
          product={selectedProduct}
          history={history}
          onBack={goBack}
        />
      ) : (
        <>
          <SearchBar onSearch={handleSearch} onClear={loadAll} />
          {loading ? (
            <div className="loading">Loading products…</div>
          ) : (
            <div className="grid">
              {products.map((p) => (
                <ProductCard key={p.productId} product={p} onClick={openProduct} />
              ))}
              {products.length === 0 && !error && <div className="loading">No products found.</div>}
            </div>
          )}
        </>
      )}
    </div>
  )
}

function ProductDetail({ product, history, onBack }) {
  return (
    <div>
      <span className="back-link" onClick={onBack}>← Back to results</span>

      {!product ? (
        <div className="loading">Loading product…</div>
      ) : (
        <>
          <div className="detail-header">
            <div className="detail-image">{product.category}</div>
            <div>
              <h2 style={{ margin: '0 0 6px' }}>{product.name}</h2>
              <div style={{ color: '#9aa0ae', marginBottom: 10 }}>{product.brand} · {product.category}</div>
              <div className="best-price" style={{ fontSize: 26 }}>
                Best price: ${product.lowestTotalPrice.toFixed(2)}
              </div>
            </div>
          </div>

          <div className="section-title">💰 Compare across platforms</div>
          <PriceTable platformPrices={product.platformPrices} />

          <div className="section-title">📊 Price history</div>
          <PriceHistoryChart history={history} />
          <PredictionPanel history={history} />

          <AlertForm productId={product.productId} />
        </>
      )}
    </div>
  )
}
