pragma solidity ^0.4.17;
import 'zeppelin-solidity/contracts/token/ERC20/StandardToken.sol';
import 'zeppelin-solidity/contracts/math/SafeMath.sol';
import 'zeppelin-solidity/contracts/ownership/Ownable.sol';


contract CarbonToken is StandardToken, Ownable {
    uint public constant MAX_UINT = (2**256) - 1; //Max number of token is some quite large number



    uint256 baseCost = 100000000000000; //100000000000000 wei 0.0001 ether
    uint256 public costPerToken = 0;

    uint256 public totalEverMinted;
    uint256 public totalEverWithdrawn;
    uint256 public poolBalance;

    //Token  variable set-up
    uint8 decimals;
    string symbol;
    string name;

    function CarbonToken(uint8 _decimals, string _symbol, string _name) {
        decimals = _decimals;
        symbol = _symbol;
        name = _name;
        updateCostOfToken(0); //first pass
    }

    function fracExp(uint k, uint q, uint n, uint precision) internal returns (uint) {
      uint s = 0;
      uint N = 1;
      uint B = 1;
      for (uint i = 0; i < precision; ++i){
        s += k * N / B / (q**i);
        N  = N * (n-i);
        B  = B * (i+1);
      }
      return s;
    }

    function growth(uint original, uint interest, uint minimaltime, uint maximumtime, int precision) internal returns (uint){

    }
    function updateCostOfToken(uint256 _supply) internal {
        //from protocol design:
        //costOfCoupon = (BaseCost + BaseCost*(1.000001618^AvailableSupply)+BaseCost*AvailableSupply/1000)
        //totalSupply == AvailableSupply
        costPerToken = baseCost+fracExp(baseCost, 618046, _supply, 2)+baseCost*_supply/1000;
        LogCostOfTokenUpdate(costPerToken);
    }


}
