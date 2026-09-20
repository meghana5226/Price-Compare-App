import { useEffect, useState } from 'react'
import { predictTrend } from '../api'

export default function PredictionPanel({ history }) {
  const [prediction, setPrediction] = useState(null)
  const [error, setError] = useState(null)

  useEffect(() => {
    if (!history || history.length === 0) return

    const lowestPerTimestamp = {}
    history.forEach((p) => {
      const key = p.recordedAt
      if (!lowestPerTimestamp[key] || p.totalCost < lowestPerTimestamp[key]) {
        lowestPerTimestamp[key] = p.totalCost
      }
    })
    const series = Object.keys(lowestPerTimestamp)
      .sort()
      .map((k) => lowestPerTimestamp[k])

    predictTrend(series)
      .then(setPrediction)
      .catch((err) => setError(err.message))
  }, [history])

  if (error) {
    return (
      <div className="prediction-box">
        ⚠️ AI prediction service unavailable ({error}). Make sure <code>ai-service/app.py</code> is running on port 5001.
      </div>
    )
  }

  if (!prediction) return null

  const trendClass = `trend-${prediction.trend}`
  const icon = prediction.trend === 'falling' ? '📉' : prediction.trend === 'rising' ? '📈' : '➖'

  return (
    <div className="prediction-box">
      <strong className={trendClass}>{icon} AI Price Prediction: {prediction.trend.toUpperCase()}</strong>
      <div style={{ marginTop: 6 }}>{prediction.recommendation}</div>
      {prediction.predicted_next_price != null && (
        <div style={{ marginTop: 6, fontSize: 13, color: '#9aa0ae' }}>
          Estimated next price: ${prediction.predicted_next_price} &nbsp;·&nbsp; Model confidence: {prediction.confidence}%
        </div>
      )}
    </div>
  )
}
