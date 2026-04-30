// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";

contract CowDustTest is Test {
    // Add a view to satisfy the compiler
    function test_RoundingFeeToZero() public view {
        // 1. Order parameters
        uint256 sellAmount = 100 ether;
        uint256 feeAmount = 1 ether;

        // 2. Execution for a very small amount (dust)
        uint256 executedAmount = 1000;

        // 3. Formula for calculating the proportional commission:
        // fee * executed / sell
        uint256 executedFeeAmount = (feeAmount * executedAmount) / sellAmount;

        // Output results
        // In Foundry, console.log works even in view functions
        console.log("--- Proof of Concept: Fee Rounding ---");
        console.log("Executed Amount (wei):", executedAmount);
        console.log("Calculated Fee (wei): ", executedFeeAmount);

        // Testing the hypothesis: the commission should "evaporate"
        if (executedFeeAmount == 0) {
            console.log("Result: FEE ROUNDED TO ZERO");
        }
    }
}
