pragma solidity ^0.4.17;
import './Ownable.sol';
import './SOMCoin.sol';


contract UnlockVault is SOMCoin, Ownable{

    uint public availableFund = 0;

    struct CarbondAsset {
        uint registryID;
        string assetName;
        uint carbonAsset;
    }

    CarbondAsset[] public carbonAssets;
    address public openAddress;

    function addOpenAddress(address _openAddress) public onlyOwner {
        openAddress = _openAddress;
    }


    modifier onlyOpenAddress() {
        require(msg.sender == openAddress);
    }


    function unlock_reserve(string _assetName, uint _carbonAsset) public onlyOwner {
        if (_openAddress == msg.sender) revert;
        carbonAssets.push(CarbonAsset(carbonAsset.length, _assetName, _carbonAsset));
        availableFund = availableFund + _carbonAsset;
        allowance(msg.sender, msg.sender);
        increaseApproval(msg.sender, _carbonAsset);
        transferFrom(openAddress, _carbonAsset );
    }


}
