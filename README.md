# TecX-OQP
TecX Omni Quant Platform

# To generate the first module (The Directory Structure and Core Data Models)
This is the foundational step. We are setting up a Microservices Architecture designed for high speed, multi-tenancy, and multi-market compatibility.

Step 1: Modular Directory Structure
This structure separates the "High-Speed Execution" (Go) from the "AI Intelligence" (Python) while ensuring the "Mobile/Web" (Node/FastAPI) can talk to both.
```
omni-quant-platform/
├── apps/
│   ├── execution-engine/      # [Go] High-frequency adapters (Dhan, Binance, OANDA)
│   ├── ai-brain/              # [Python] TFT Models, PPO Reinforcement Learning
│   ├── api-gateway/           # [FastAPI] Main entry point for Web/Mobile
│   ├── mobile_app/            # [Flutter] Cross-platform control app
│   └── web-dashboard/         # [React/Tailwind] Pro-quant analytics interface
├── core/
│   ├── risk-shield/           # [Go] Independent server-side risk validator
│   ├── data-ingestor/         # [Go/Python] WebSocket managers for Nifty/Crypto
│   └── common/                # Shared Protobuf definitions (gRPC)
├── infrastructure/
│   ├── docker/                # Dockerfiles for each service
│   ├── helm/                  # Kubernetes charts for SaaS scaling
│   └── local-sync/            # Sync-agent for running on personal PC
├── data/
│   ├── migrations/            # TimescaleDB & PostgreSQL schemas
│   └── notebooks/             # Research & Backtesting labs
└── scripts/                   # Deployment and Metering/Billing scripts

```
Step 2: Core Data Models (PostgreSQL/TimescaleDB)

To support Multi-Tenancy and Universal Assets, we use a schema that isolates user data and optimizes time-series market data.


Step 3: High-Speed Market Ingestion (Go Snippet)
This is a boilerplate for the Go-based Market Data Adapter. It uses WebSockets to handle high-frequency data for Nifty/Crypto simultaneously.


# To generate the "AI Brain" (Python) with the Temporal Fusion Transformer (TFT) model logic for price forecasting next
