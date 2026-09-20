export default function PriceTable({ platformPrices }) {
  return (
    <table className="price-table">
      <thead>
        <tr>
          <th>Platform</th>
          <th>Price</th>
          <th>Shipping</th>
          <th>Total</th>
          <th>Stock</th>
          <th>Link</th>
        </tr>
      </thead>
      <tbody>
        {platformPrices.map((p) => (
          <tr
            key={p.platformName}
            className={`${p.bestDeal ? 'best-row' : ''} ${!p.inStock ? 'out-of-stock' : ''}`}
          >
            <td>{p.platformName} {p.bestDeal && <span className="badge">Best deal</span>}</td>
            <td>${p.price.toFixed(2)}</td>
            <td>{p.shippingCost ? `$${p.shippingCost.toFixed(2)}` : 'Free'}</td>
            <td><strong>${p.totalCost.toFixed(2)}</strong></td>
            <td>{p.inStock ? 'In stock' : 'Out of stock'}</td>
            <td><a href={p.productUrl} target="_blank" rel="noreferrer">View →</a></td>
          </tr>
        ))}
      </tbody>
    </table>
  )
}
