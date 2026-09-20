import { useState } from 'react'
import { createAlert } from '../api'

export default function AlertForm({ productId }) {
  const [email, setEmail] = useState('')
  const [targetPrice, setTargetPrice] = useState('')
  const [status, setStatus] = useState(null)

  async function handleSubmit(e) {
    e.preventDefault()
    setStatus('Saving...')
    try {
      await createAlert(productId, email, parseFloat(targetPrice))
      setStatus(`✅ You'll be notified when the price drops below $${targetPrice}.`)
      setEmail('')
      setTargetPrice('')
    } catch (err) {
      setStatus(`❌ ${err.message}`)
    }
  }

  return (
    <div>
      <div className="section-title">🔔 Set a price drop alert</div>
      <form className="alert-form" onSubmit={handleSubmit}>
        <input
          type="email"
          placeholder="your@email.com"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          required
        />
        <input
          type="number"
          step="0.01"
          placeholder="Target price ($)"
          value={targetPrice}
          onChange={(e) => setTargetPrice(e.target.value)}
          required
        />
        <button type="submit">Notify me</button>
      </form>
      {status && <div className="status-msg">{status}</div>}
    </div>
  )
}
