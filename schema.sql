-- 1. Tenant Management (For SaaS Scaling)
CREATE TABLE tenants (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    api_key_vault_ref TEXT, -- Reference to encrypted vault
    tier TEXT DEFAULT 'basic', -- For billing/metering
    created_at TIMESTAMPTZ DEFAULT now()
);

-- 2. Multi-Asset Market Data (TimescaleDB Hypertable)
CREATE TABLE market_data (
    time TIMESTAMPTZ NOT NULL,
    symbol TEXT NOT NULL,      -- e.g., 'NIFTY50', 'BTCUSDT', 'GOLD_MCX'
    exchange TEXT NOT NULL,    -- e.g., 'NSE', 'BINANCE', 'MCX'
    price_open NUMERIC,
    price_high NUMERIC,
    price_low NUMERIC,
    price_close NUMERIC,
    volume NUMERIC
);
SELECT create_hypertable('market_data', 'time');

-- 3. Risk Parameters (The Risk Shield)
CREATE TABLE user_risk_profile (
    tenant_id UUID REFERENCES tenants(id),
    max_drawdown_pct NUMERIC DEFAULT 5.0,
    max_position_size NUMERIC,
    auto_stop_loss_pct NUMERIC DEFAULT 1.5,
    is_active BOOLEAN DEFAULT true
);
