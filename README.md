# Cerify - Smart Contract Verification Platform

Cerify is a cutting-edge blockchain platform for automated analysis, verification, and certification of Ethereum smart contracts. It provides comprehensive security analysis and vulnerability detection for smart contracts.

## Features

- Automated smart contract analysis and verification
- Security vulnerability detection
- Contract certification
- RESTful API for integration
- Support for Ethereum smart contracts
- Detailed security scoring and reporting

## Prerequisites

- Node.js (v16 or higher)
- MongoDB
- Ethereum node access (Infura, local node, etc.)

## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/cerify-contract.git
cd cerify-contract
```

2. Install dependencies:
```bash
npm install
```

3. Create a `.env` file in the root directory with the following variables:
```env
PORT=3000
MONGODB_URI=mongodb://localhost:27017/cerify
ETHEREUM_RPC_URL=your_ethereum_node_url
PRIVATE_KEY=your_private_key_for_contract_deployment
```

## Development

Start the development server:
```bash
npm run dev
```

## Testing

Run the test suite:
```bash
npm test
```

## Smart Contract Deployment

Deploy the verification contract:
```bash
npm run deploy
```

## API Endpoints

### Health Check
```
GET /health
```

### Verify Contract
```
POST /api/verify
Content-Type: application/json

{
  "contractAddress": "0x...",
  "sourceCode": "contract Example { ... }"
}
```

### Get Verification Result
```
GET /api/verification/:contractAddress
```

## Security Analysis Features

- Reentrancy detection
- Unchecked external calls
- Integer overflow/underflow
- Access control issues
- Gas optimization
- Best practices compliance

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

For support, please open an issue in the GitHub repository or contact the maintainers. 