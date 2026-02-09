// core/data-ingestor/main.go
package main

import (
    "fmt"
    "://github.com"
)

type TickData struct {
    Symbol   string  `json:"s"`
    Price    float64 `json:"p"`
    Quantity float64 `json:"q"`
    Exchange string  `json:"e"`
}

func startIngestor(endpoint string) {
    conn, _, _ := websocket.DefaultDialer.Dial(endpoint, nil)
    defer conn.Close()

    for {
        _, message, err := conn.ReadMessage()
        if err != nil {
            return
        }
        // Send to Redis for the AI Brain and Execution Engine to consume
        fmt.Printf("Tick Received: %s\n", string(message))
    }
}

func main() {
    // Start multiple goroutines for Nifty (NSE) and Crypto (Binance)
    go startIngestor("wss://://stream.binance.com")
    go startIngestor("wss://api.dhan.co/ws/nifty50") 
    select {} // Keep running
}
