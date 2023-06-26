// SPDX-License-Identifier: MIT
pragma solidity >= 0;

contract sendTransferCall {
    /*
    이더를 보내는 3가지
    1. send : 2300 gas, 성공여부를 true 또는 false로 리턴한다. 주소 타입의 내장 함수
    2. transfer : 2300 gas, 실패시 에러를 발생, 주소 타입의 내장 함수
    3. call : 
        가변적인 gas, (gas값 지정 가능), 성공여부를 true 또는 false로 리턴
        재진입 (reEntrancy) 공격 위험성 있음. (트랜잭션이 끝나기 전에 재진입하여 이더를 빼오는것. gas가 가변적이기 때문이다.)
        2019년 12월 이후 call 사용을 추천

    A의 잔액이 1 ether인 상황에서 전송을 가정

    A -5 ether-> B
    send : 잔액이 부족하지만 트랜잭션이 실패하지는 않음. 다만 성공여부가 false로 리턴됨. 
    transfer : 잔액이 부족하여 에러가 발생하고 트랜잭션이 실패함
    call : send와 마찬가지

    payable
    payable은 이더 송수신을 할 때 필요한 키워드
    즉 send, transfer 로 이더를 보낼 때 주소는 payable이라는 키워드가 필요하다.
    payable은 주로 함수, 주소, 생성자에 붙여서 사용한다.
    call은 payable 필요 없다.

    msg.value
    msg.value는 송금보낸 이더의 값
    */

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


/*
call로 외부 스마트 컨트랙트 함수 호출하기
    준비물 : 호출하려는 외부 스마트 컨트랙트 주소 + 호출하려는 외부 스마트 컨트랙트트 함수명

*/
contract callEx1{
    function addNumber(uint256 _num1, uint _num2) public pure returns(uint) {
        return _num1 + _num2;
    }

    function whoIsMsgSender() public view returns(address) {
        return msg.sender;
    }
}

contract callEx2{
    event howMuch(uint _value);

    function callAddNumber(address _address, uint _num1, uint _num2) public returns(bool, bytes memory) {
         (bool sent, bytes memory outputFromCalledFunction) = _address.call(abi.encodeWithSignature("addNumber(uint256,uint256)", _num1, _num2));
         string memory errorMessage = string(outputFromCalledFunction);
         require(sent, errorMessage);
         return (sent, outputFromCalledFunction);
    }

    function callWhoIsMsgSender(address _address) public returns(bool, bytes memory) {
         (bool sent, bytes memory outputFromCalledFunction) = _address.call(abi.encodeWithSignature("whoIsMsgSender()"));
         require(sent, "failed"); 
         return (sent, outputFromCalledFunction); //callEx2 스마트 컨트랙의 주소가 반환됨됨
    }
}


/*
fallback
    이름 그대로 대비책 함수
왜 쓰는가?
    스마트 컨트랙이 이더를 받을 수 있게 한다
    이더를 받고 난 후 어떠한 행동을 취하게 할 수 있다.
    call함수로 없는 함함수가 불려질 때, 어떠한 행동을 취하게 할 수 있다.

0.6 이전
function() external payable {

}

0.6 이후
fallback -> fallback과 recieve

receive : 순수하게 이더만 받을 때 작동한다.
fallback : 없는 함수를 호출할 때, 없는 함수를 호출하면서 이더를 전송할 때 발생한다.
*/


contract fallbackSafe {
    event received(address _from, uint _amount);
    event justFallBack(string _str);

    receive() external payable {
        emit received(msg.sender, msg.value);
    }

    fallback() external payable {
        emit justFallBack("No function");
    }

    function checkMyBalance() public view returns(uint) {
        return address(this).balance;
    }
}