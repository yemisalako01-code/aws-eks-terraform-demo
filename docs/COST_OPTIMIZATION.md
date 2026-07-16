# EKS Cost Optimization Guide

## Strategies Implemented
1. **Spot Instances**: Utilized Spot Groups for non-critical workloads (40-70% savings).
2. **Right-Sizing**: Implemented Karpenter for automatic node scaling based on metrics.
3. **Reserved Instances**: Applied RIs for steady-state baseline capacity.
4. **Cleanup Polices**: Automated removal of unused load balancers and EBS volumes.

## Expected Savings
- 45% reduction in monthly compute costs.
- 20% reduction in storage costs via lifecycle policies.