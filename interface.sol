// SPDX-License-Identifier: MIT
pragma solidity >= 0;

/*
interface
1. external만 사용 가능
2. enum, struct 가능
3. 변수, 생성자 불가


*/
interface ItemInfo {
    struct Item{
        string name;
        uint256 price;
    }

    function addItemInfo(string memory _name, uint256 _price) external;
    function getItemInfo(uint256 _index) external view returns(Item memory);
}

contract interfaceEx is ItemInfo {
    Item[] public itemList;


    function addItemInfo(string memory _name, uint256 _price) external {
        itemList.push(Item(_name,_price));
    }

    function getItemInfo(uint256 _index) external view returns(Item memory) {
        return itemList[_index];
    }
}