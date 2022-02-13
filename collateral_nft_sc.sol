pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";

contract PersonalLoanNFTCollateral is ERC20 {
    address payable public lenderAddress;
    address payable public borrowerAddress;
    address public contractAddress;

    struct Terms {
        uint totalLoanAmountETH;
        uint interestAmountETH;
        uint repayByTimestamp;
        uint collateralAmountNFT;
    }
    Terms public terms;

    // There are 5 states this contract can be in: Created, Funded, Taken, Repayed, Liquidated.
    // Only 3 are listed as the latter 2 will result in the termination of the contract.
    enum LoanState {
        Created, Funded, Taken
    }
    LoanState public state;

    modifier onlyInState(LoanState expectedState) {
        require(state == expectedState,
        "Not allowed: This function can only be performed in a different contract state."
        );
        _;
    }

    constructor(Terms memory _terms, address _contractAddress) public {
        terms = _terms;
        contractAddress = _contractAddress;
        lenderAddress = msg.sender;
        state = LoanState.Created;
    }
    
    function fundLoan() public onlyInState(LoanState.Created) {
        state = LoanState.Funded;
        ERC20(contractAddress).transferFrom(
            msg.sender,
            address(this),
            terms.totalLoanAmountETH
        ); 
        // external returns (bool);
    }

    function takeLoanAndAcceptTerms() public payable onlyInState(LoanState.Funded) {
        require(msg.value == terms.collateralAmountNFT, 
        "Invalid collateral amount. Please match to the agreed upon terms."
        );
        borrowerAddress = msg.sender;
        state = LoanState.Taken;
        ERC20(contractAddress).transfer(
            borrowerAddress,
            terms.totalLoanAmountETH
        );
        // external returns (bool);
    }

    function repayLoan() public onlyInState(LoanState.Taken) {
        require(msg.sender == borrowerAddress,
        "Only the borrower can repay this loan and collect their collateral."
        );
        ERC20(contractAddress).transferFrom(
            borrowerAddress,
            lenderAddress,
            terms.totalLoanAmountETH
        );
        // external returns (bool);
        // Sends collateral back to borrower and fulfills (destroys) the contract.
        selfdestruct(borrowerAddress);
    }

    function liquidateLoan() public onlyInState(LoanState.Taken) {
        require(msg.sender == lenderAddress,
        "Only the lender can liquidate this loan and collect the collateral."
        );
        require(block.timestamp > terms.repayByTimestamp,
        "You cannot liquidate this loan until the repayment due date has passed."
        );
        // Sends collateral to lender and liquidates (destroys) the contract.
        selfdestruct(lenderAddress);
    }

}


