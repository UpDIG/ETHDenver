pragma solidity ^0.4.17;
import './Ownable.sol';
import './SOMCoin.sol';

contract CarbonLoan is SOMCoin { 

    event NewLoanRequested(uint id);
    event LoanApproved(uint id);
    event PaidBack(uint id);
    
    uint public availableFund = totalSupply;

    struct DebtorStruct {
        uint registryID;
        //address[] loan_cosigners; //Distributor co-sign the loan to payback on the debtor behalf
        uint numloans;
        uint owe;
        uint paid;
        bool canborrow;
    }

    mapping (address => DebtorStruct) public debtors;
    address[] public DebtorIndexes;

    function isRegisteredDebtor(address debtor_address) public constant returns(bool isIndeed) {
       if (DebtorIndexes.length == 0) return false;
       return (DebtorIndexes[debtors[debtor_address].registryID] == debtor_address);
    }

    function newDebtorSignup() public {
        if (msg.sender == address(0)) revert();
        if (isRegisteredDebtor(msg.sender)) revert();
        debtors[msg.sender].registryID = DebtorIndexes.push(msg.sender) - 1 ;
        debtors[msg.sender].numloans = 0;
        debtors[msg.sender].owe = 0;
        debtors[msg.sender].paid = 0;
        debtors[msg.sender].canborrow = true;
        
    }


    function approveloan(address debtor_address) public returns (bool success){
        if (!isRegisteredDebtor(debtor_address)) revert();
        //uint registryID = DebtorIndexes[debtor_address];
        // uint owe = debtors[debtor_address].owe;
        // uint paid = debtors[debtor_address].paid;
        bool canborrow = debtors[debtor_address].canborrow;
        if (! canborrow) return false;
        Transfer(msg.sender, debtor_address, 5);
        availableFund = availab
        return true;
    }

}
