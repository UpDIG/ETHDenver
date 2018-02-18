pragma solidity ^0.4.17;
import './Ownable.sol';
import './SOMCoin.sol';


contract UnlockVault is Ownable, SOMCoin {

    uint public availableFund = 0;

    struct CarbonAsset {
        uint registryID;
        string assetName;
        uint carbonAsset;
    }

    CarbonAsset[] public carbonAssets;
    address public openAddress;

    function addOpenAddress(address _openAddress) public onlyOwner {
        openAddress = _openAddress;
    }

    modifier onlyOpenAddress() {
        require(msg.sender == openAddress);
        _;
    }


    function unlock_reserve(string _assetName, uint _carbonAsset) public onlyOwner {
        carbonAssets.push(CarbonAsset(carbonAssets.length, _assetName, _carbonAsset));
        availableFund = availableFund + _carbonAsset;
        allowance(msg.sender, msg.sender);
        increaseApproval(msg.sender, _carbonAsset);
        transferFrom(msg.sender, openAddress, _carbonAsset );
    }


}
