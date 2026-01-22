# Crypto Liquidity Regime Detection
Detect early crypto liquidity regime shifts using trade-level microstructure signals and DuckDB-powered analytics.

**Author:** Zhao Jun Lee  
**Repository:** [crypto-liquidity-regime-shift-detection-engine](#)  
**Last Updated:** January 2026

---

## Project Overview

This project implements a **framework for detecting directional liquidity regimes in cryptocurrency markets** using **open-source aggregated trade data from Binance**. 
It focuses on identifying **buy/sell imbalance pressure and volume bursts** as indicators of potential price movements.  

The methodology is inspired by professional trading research on **market microstructure and liquidity efficiency**, and is designed to help analysts or quants spot **liquidity-driven events** that can precede short-term market trends.

Key objectives:
- Build **OHLCV bars** from raw trade data.
- Compute **liquidity features**:
  - Buy/Sell Imbalance (`imbalance`)
  - Relative Volume (`vol_burst`)
  - Liquidity Efficiency (`illiquidity` – Amihud proxy)
- Detect **buy/sell pressure events** based on cumulative imbalance and volume pressure.
- Visualize events alongside price to validate signals.

---

## Repository Structure
