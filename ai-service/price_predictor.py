"""
Lightweight price-trend predictor.

Given a chronological list of historical total-cost values for a product,
fits a simple linear regression (numpy.polyfit, degree 1) to estimate the
trend direction and project the next value. This is intentionally simple
so it runs instantly with no training step or external model file -- the
documented upgrade path (see README) is to swap this for a proper time
series model (e.g. Prophet, ARIMA, or an LSTM) once there's enough
real historical data to justify it.
"""

import numpy as np


def predict_trend(history: list[float]) -> dict:
    if len(history) < 2:
        return {
            "trend": "insufficient_data",
            "predicted_next_price": history[-1] if history else None,
            "confidence": 0.0,
            "recommendation": "Not enough price history to make a prediction yet.",
        }

    x = np.arange(len(history))
    y = np.array(history, dtype=float)

    slope, intercept = np.polyfit(x, y, 1)
    predicted_next = float(slope * len(history) + intercept)

    # R^2 as a rough confidence signal
    y_pred = slope * x + intercept
    ss_res = np.sum((y - y_pred) ** 2)
    ss_tot = np.sum((y - np.mean(y)) ** 2)
    r_squared = 1 - (ss_res / ss_tot) if ss_tot > 0 else 1.0
    confidence = round(max(0.0, min(1.0, r_squared)) * 100, 1)

    pct_change = ((predicted_next - history[-1]) / history[-1]) * 100 if history[-1] else 0

    if slope < -0.01 * (np.mean(y) if np.mean(y) else 1):
        trend = "falling"
        recommendation = "Price is trending down — consider waiting a few days before buying."
    elif slope > 0.01 * (np.mean(y) if np.mean(y) else 1):
        trend = "rising"
        recommendation = "Price is trending up — buying now may be cheaper than waiting."
    else:
        trend = "stable"
        recommendation = "Price has been stable — current price is a reasonable time to buy."

    return {
        "trend": trend,
        "predicted_next_price": round(predicted_next, 2),
        "percent_change_estimate": round(pct_change, 2),
        "confidence": confidence,
        "recommendation": recommendation,
    }
