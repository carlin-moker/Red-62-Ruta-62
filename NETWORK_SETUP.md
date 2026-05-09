# Red 62 Network Setup Guide - CosmicGemLogistic

## 📋 Table of Contents
1. [Overview](#overview)
2. [System Requirements](#system-requirements)
3. [Installation](#installation)
4. [Configuration](#configuration)
5. [Running Different Node Types](#running-different-node-types)
6. [Network Topology](#network-topology)
7. [Troubleshooting](#troubleshooting)

---

## Overview

**Red 62** is an independent blockchain network using **Proof of Stake (PoS)** consensus.

### Network Specifications
- **Chain ID:** 62
- **Network Name:** CosmicGemLogistic-Red-62
- **Consensus:** Proof of Stake (PoS)
- **Block Time:** 12 seconds
- **RPC Port:** 8545
- **P2P Port:** 30303

---

## System Requirements

### Minimum Specifications
```
CPU: 4 cores (8+ recommended)
RAM: 8GB (16GB+ for validators)
Storage: 500GB SSD (1TB+ recommended)
Network: 100 Mbps (1 Gbps recommended)
Uptime: 99.9%
```

### Supported Operating Systems
- Linux (Ubuntu 20.04+, CentOS 8+)
- macOS (Intel & Apple Silicon)
- Windows (WSL2)

---

## Installation

### 1. Clone Repository
```bash
git clone https://github.com/carlin-moker/Red-62-Ruta-62.git
cd Red-62-Ruta-62
```

### 2. Install Dependencies
```bash
npm install
# or
yarn install
```

### 3. Setup Environment
```bash
# Copy template
cp .env.example .env

# Edit with your values
nano .env
```

### 4. Create Required Directories
```bash
mkdir -p data/node-db
mkdir -p data/backups
mkdir -p logs
mkdir -p certs
```

### 5. Generate Validator Keys (For Validators Only)
```bash
npm run generate-keys

# This creates:
# - certs/validator-private.key
# - certs/validator-public.key
```

---

## Configuration

### Environment Variables (`.env`)

```bash
# Network Identity
CHAIN_ID=62
CHAIN_NAME=CosmicGemLogistic-Red-62
NETWORK_TYPE=Independent

# Node Type (full, validator, archive)
NODE_TYPE=full

# RPC Configuration
RPC_PORT=8545
RPC_HOST=0.0.0.0
RPC_ENDPOINTS_PRIMARY=http://localhost:8545

# Validator Configuration (if applicable)
VALIDATOR_ADDRESS=0x...
VALIDATOR_NAME=MyNode

# Seeds & Peers
SEED_NODES=seed1.cosmicgemlogistic.node,seed2.cosmicgemlogistic.node
PEER_PORT=30303
MAX_PEERS=50

# Security
ENABLE_TLS=true
TLS_CERT_PATH=./certs/node-cert.pem
TLS_KEY_PATH=./certs/node-key.pem

# Logging
LOG_LEVEL=info
LOG_FILE=./logs/node.log
```

---

## Running Different Node Types

### 1. Full Node (Default)
A full node validates all blocks and maintains complete blockchain history.

```bash
# Set in .env
NODE_TYPE=full

# Start node
npm start
```

**Use Case:** General blockchain interaction, RPC queries

### 2. Validator Node
A validator node participates in consensus and produces new blocks.

```bash
# Set in .env
NODE_TYPE=validator
VALIDATOR_ADDRESS=0x...

# Generate keys
npm run generate-keys

# Start validator
npm start -- --validator
```

**Use Case:** Network participation, block production, staking

**Requirements:**
- Minimum 32 coins staked
- Generated validator keys
- High uptime (>95%)
- Separate security zone

### 3. Archive Node
Archive nodes maintain complete state history for historical queries.

```bash
# Set in .env
NODE_TYPE=archive
SYNC_MODE=archive

# Start archive node
npm start -- --archive
```

**Use Case:** Data analysis, historical queries, backups

**Storage:** 5TB+ recommended

### 4. Seed Node
Seed nodes help bootstrap new network participants.

```bash
# Set in .env
NODE_TYPE=seed
PEER_PORT=30303

npm start -- --seed
```

**Use Case:** Network bootstrap, peer discovery

---

## Network Topology

### Recommended Setup

```
                    Internet
                       |
        ┌──────────────┼──────────────┐
        │              │              │
    ┌───▼────┐    ┌────▼───┐    ┌────▼───┐
    │ Seed 1 │    │ Seed 2 │    │ Seed 3 │
    └───┬────┘    └────┬───┘    └────┬───┘
        │              │              │
    ┌───▼──────────────▼──────────────▼───┐
    │                                      │
    │  Validator Network (Private)         │
    │  ├─ Validator 1                      │
    │  ├─ Validator 2                      │
    │  └─ Validator 3                      │
    │                                      │
    └──────────────────────────────────────┘
            │
    ┌───────▼────────────────┐
    │  Full Nodes (Public)   │
    │  ├─ Full Node 1        │
    │  ├─ Full Node 2        │
    │  └─ Full Node 3        │
    └────────────────────────┘
```

### Deployment Zones

1. **Bootstrap Zone (Seed Nodes)**
   - Internet-facing
   - High availability
   - Standard security

2. **Validator Zone (Private)**
   - Behind firewall
   - Private P2P network
   - Enhanced security

3. **Public Zone (Full Nodes)**
   - Internet-facing
   - Rate limiting enabled
   - Standard security

---

## Monitoring

### Health Check
```bash
# Check node status
npm run health-check

# Monitor logs
tail -f logs/node.log

# RPC query
curl -X POST http://localhost:8545 \
  -H "Content-Type: application/json" \
  -d '{"jsonrpc":"2.0","method":"net_version","params":[],"id":1}'
```

### Metrics
```bash
# Access Prometheus metrics
curl http://localhost:9090/metrics
```

---

## Troubleshooting

### Node Won't Start
```bash
# Check environment variables
env | grep CHAIN_ID

# Validate config
npm run validate-config

# Check port availability
lsof -i :8545
lsof -i :30303
```

### Sync Issues
```bash
# Check peer connections
npm run check-peers

# Reset sync (careful!)
rm -rf data/node-db/
npm start
```

### High Memory Usage
```bash
# Reduce max peers
MAX_PEERS=20

# Enable pruning
ENABLE_PRUNING=true

# Restart
npm start
```

---

## Support

For issues and questions:
- GitHub Issues: https://github.com/carlin-moker/Red-62-Ruta-62/issues
- Security: See SECURITY.md
- Email: carlingonzalez24819@gmail.com
