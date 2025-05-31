// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

/**
 * @title CerifyVerifier
 * @dev Contract for managing smart contract verification results
 */
contract CerifyVerifier is Ownable, ReentrancyGuard {
    struct VerificationResult {
        address contractAddress;
        bool isVerified;
        string verificationHash;
        uint256 timestamp;
        string[] vulnerabilities;
        uint8 securityScore;
    }

    mapping(address => VerificationResult) public verificationResults;
    mapping(address => bool) public authorizedVerifiers;

    event ContractVerified(
        address indexed contractAddress,
        bool isVerified,
        string verificationHash,
        uint8 securityScore
    );

    event VerifierAuthorized(address indexed verifier, bool status);

    constructor() Ownable(msg.sender) {}

    modifier onlyAuthorizedVerifier() {
        require(authorizedVerifiers[msg.sender], "Not authorized verifier");
        _;
    }

    function authorizeVerifier(address verifier, bool status) external onlyOwner {
        authorizedVerifiers[verifier] = status;
        emit VerifierAuthorized(verifier, status);
    }

    function submitVerification(
        address contractAddress,
        bool isVerified,
        string calldata verificationHash,
        string[] calldata vulnerabilities,
        uint8 securityScore
    ) external onlyAuthorizedVerifier nonReentrant {
        require(contractAddress != address(0), "Invalid contract address");
        require(bytes(verificationHash).length > 0, "Invalid verification hash");
        require(securityScore <= 100, "Invalid security score");

        verificationResults[contractAddress] = VerificationResult({
            contractAddress: contractAddress,
            isVerified: isVerified,
            verificationHash: verificationHash,
            timestamp: block.timestamp,
            vulnerabilities: vulnerabilities,
            securityScore: securityScore
        });

        emit ContractVerified(
            contractAddress,
            isVerified,
            verificationHash,
            securityScore
        );
    }

    function getVerificationResult(address contractAddress)
        external
        view
        returns (VerificationResult memory)
    {
        return verificationResults[contractAddress];
    }
} 