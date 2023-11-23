// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DegenToken is ERC20 {
    address public owner;
    uint itemId;

    struct Items {
        address owner;
        string name;
        uint256 amount;
    }

    mapping(uint => Items) public IdToItems;

    constructor() ERC20("EGO", "ego") {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function createItems(string memory _name, uint256 amount) public onlyOwner {
        itemId++;
        Items storage items = IdToItems[itemId];
        items.owner = msg.sender;
        items.name = _name;
        items.amount = amount;
        IdToItems[itemId] = items;
    }

    function burn(uint amount) public {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _burn(msg.sender, amount);
    }

    function redeem(uint8 itemID_) public {
        require(itemID_ <= itemId, "item not found");
        transfer(IdToItems[itemID_].owner, IdToItems[itemID_].amount);
        IdToItems[itemID_].owner = msg.sender;
    }

    function viewItemOwner(uint8 itemID_) public view returns (address) {
        return IdToItems[itemID_].owner;
    }

    function showItem(uint id_) public view returns (Items memory) {
        return IdToItems[id_];
    }
}
