// SPDX-License-Identifier: MIT
pragma solidity >= 0;

contract balance {
    /*
    msg.sender
        msg.sender 트랜잭션을 주는 존재

    balance
        현재 이더의 잔액
        주소.balance
    */

    function getMsgSender() public view returns(address) {
        return msg.sender;
    }

    function balance1(address _a) public view returns(uint) {
        return _a.balance;
    }
    function balance2() public view returns(uint) {
        return (msg.sender).balance;
    }
}