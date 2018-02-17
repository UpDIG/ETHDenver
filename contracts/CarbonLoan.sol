pragma solidity ^0.4.17;
import 'zeppelin-solidity/contracts/token/ERC20/StandardToken.sol';
import 'zeppelin-solidity/contracts/math/SafeMath.sol';
import 'zeppelin-solidity/contracts/ownership/Ownable.sol';
import 'dharma/contracts/TermsContract.sol'

contract CarbonLoan is StandardToken, Ownable{ 
    enum State {RequestingLoan, LoanApproved, LoanReceived, LoanPaid}


    function isLoanState(Loan storage self, LoanState state) returns (bool) {
    updateCurrentLoanState(self);
    return self.state == state;
  }

    //Event declaration
    event NewLoanRequested(uint id);
    event LoanApproved(uint id);
    event PaidBack(uint id);

    struct DebtorStruct {
        uint registryID;
        address[] loan_cosigners; //Distributor co-sign the loan to payback on the debtor behalf
        uint numloans;
        uint owe;
        uint paid;
        bool canborrow;
    }

    mapping (address => DebtorStruct) public debtors;
    address[] public DebtorIndex;

    function isRegisteredDebtor(address debtor_address) public constant returns(bool isIndeed) {
       if (providerIndex.length == 0) return false;
       return (DebtorIndex[DebtorStruct[debtor_address].registryID] == debtor_address);
   }

   function requestCosignLoan(address)

    function newDebtorSignup() internal {
        if (msg.sender == address(0)) revert();
        if (isRegisteredDebtor(msg.sender)) revert();
        debtors[msg.sender].numloans = 0;
        debtors[msg.sender].owe = 0;
        debtors[msg.sender].paid = 0;
        debtors[msg.sender].canborrow = 0;
        
    function requestloan()

    function approveloan()




        uint debtorid  = debtors.push(debtor_address, 0, 0, 0, true) - 1;
        idtoDebtor[id] = debtor_address;


    }

    
    function _createNewLoan(address debtor, uint amount, uint duration) internal onlyOwner {
        uint loanid = loans.push(Loan(debtor, amount, duration)) - 1;
        loantoDebtor[loanid] = debtor;

        
        lo


        Loan currentLoan;

        NewLoan(numLoans - 1);

    }



}
