export default function ProductCard({ product, onClick }) {
  return (
    <div className="card" onClick={() => onClick(product.productId)}>
      <div className="card-image">{product.category}</div>
      <h3>{product.name}</h3>
      <div className="brand">{product.brand}</div>
      <div>
        <span className="best-price">${product.lowestTotalPrice.toFixed(2)}</span>
        <span className="badge">{product.platformPrices.length} platforms</span>
      </div>
    </div>
  )
}
