# CoW Protocol Security Analysis - Fee Rounding Vulnerability

## Description
During a security review of the \`GPv2Settlement\` contract, a precision loss vulnerability was identified in the proportional fee calculation logic. 

## Vulnerability Detail
The \`executedFeeAmount\` is calculated using:
\$(feeAmount \cdot executedAmount) / sellAmount\$

For \`partiallyFillable\` orders, a solver can execute extremely small trades (dust) where the product of \`feeAmount\` and \`executedAmount\` is less than \`sellAmount\`, resulting in a zero fee due to integer division rounding down.

## Impact
Cumulative fee leakage. A malicious solver can drain a \`partiallyFillable\` order via thousands of micro-transactions, completely bypassing protocol fees.

## Proof of Concept
Refer to \`test/DustAttack.t.sol\`.
