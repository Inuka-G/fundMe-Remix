// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "./PriceConverter.sol";

contract FundMe {
    using  PriceConverter for uint256;
    uint256 public constant MININUM_USD_VALUE = 50 * 1e18;
    address[] public  funders;
    mapping (address=>uint256) addressToAmount;
    function fund() public payable {
        require(msg.value.getConversionRate() >= MININUM_USD_VALUE, "Didnt sent enough ETH");
        funders.push(msg.sender);
        addressToAmount[msg.sender]=msg.value;
    }

   

    
}
