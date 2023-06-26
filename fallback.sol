// SPDX-License-Identifier: MIT
pragma solidity >= 0.1.0;



contract fallbackBefore06 {
    event howMuch(uint256 _value);

    function sendNow(address payable _to) public payable {
        bool sent = _to.send(msg.value); //에러가 발생하지 않기 때문에 에러를 발생시켜야함.
        require(sent, "Failed to send ether"); //에러 발생하고 가스 환불해줌
        emit howMuch(msg.value);
    }

    function transferNow(address payable _to) public payable {
        _to.transfer(msg.value);
        emit howMuch(msg.value);
    }

    function callNow(address payable _to) public payable {
        (bool sent, ) = _to.call{value : msg.value}("");
        require(sent, "Failed to send ether");
        emit howMuch(msg.value);
    }
}