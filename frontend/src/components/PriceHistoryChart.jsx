import {
  LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer,
} from 'recharts'

// Reshape flat [{platformName, totalCost, recordedAt}] history into
// [{ recordedAt, Amazon: 807.26, Flipkart: 793.65, ... }] so Recharts can
// draw one line per platform.
function reshapeForChart(history) {
  const byDate = {}
  history.forEach((point) => {
    const key = point.recordedAt.slice(0, 10)
    if (!byDate[key]) byDate[key] = { recordedAt: key }
    byDate[key][point.platformName] = point.totalCost
  })
  return Object.values(byDate)
}

const COLORS = ['#4f7cff', '#22c55e', '#f59e0b', '#ef4444']

export default function PriceHistoryChart({ history }) {
  if (!history || history.length === 0) {
    return <div className="chart-panel">No price history available yet.</div>
  }

  const data = reshapeForChart(history)
  const platforms = [...new Set(history.map((h) => h.platformName))]

  return (
    <div className="chart-panel">
      <ResponsiveContainer width="100%" height={260}>
        <LineChart data={data}>
          <CartesianGrid strokeDasharray="3 3" stroke="#262a37" />
          <XAxis dataKey="recordedAt" stroke="#9aa0ae" fontSize={12} />
          <YAxis stroke="#9aa0ae" fontSize={12} domain={['auto', 'auto']} />
          <Tooltip contentStyle={{ background: '#171a23', border: '1px solid #262a37' }} />
          <Legend />
          {platforms.map((platform, i) => (
            <Line
              key={platform}
              type="monotone"
              dataKey={platform}
              stroke={COLORS[i % COLORS.length]}
              strokeWidth={2}
              dot={{ r: 3 }}
              connectNulls
            />
          ))}
        </LineChart>
      </ResponsiveContainer>
    </div>
  )
}
