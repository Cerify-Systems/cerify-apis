import { Express } from 'express';
import { VerificationService } from '../services/verificationService';
import { logger } from '../utils/logger';

export const setupRoutes = (app: Express) => {
  const verificationService = new VerificationService(process.env.ETHEREUM_RPC_URL || '');

  // Health check endpoint
  app.get('/health', (req, res) => {
    res.json({ status: 'ok' });
  });

  // Contract verification endpoint
  app.post('/api/verify', async (req, res) => {
    try {
      const { contractAddress, sourceCode } = req.body;

      if (!contractAddress || !sourceCode) {
        return res.status(400).json({
          error: 'Contract address and source code are required'
        });
      }

      const result = await verificationService.verifyContract(
        contractAddress,
        sourceCode
      );

      res.json(result);
    } catch (error) {
      logger.error('Verification endpoint error:', error);
      res.status(500).json({
        error: 'Contract verification failed'
      });
    }
  });

  // Get verification result endpoint
  app.get('/api/verification/:contractAddress', async (req, res) => {
    try {
      const { contractAddress } = req.params;
      
      // TODO: Implement fetching verification result from database
      res.json({
        message: 'Not implemented yet'
      });
    } catch (error) {
      logger.error('Get verification result error:', error);
      res.status(500).json({
        error: 'Failed to fetch verification result'
      });
    }
  });
}; 