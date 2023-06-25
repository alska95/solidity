// SPDX-License-Identifier: MIT
pragma solidity >= 0;

contract sendTransferCall {
    /*
    이더를 보내는 3가지
    1. send : 2300 gas, 성공여부를 true 또는 false로 리턴한다. 주소 타입의 내장 함수
    2. transfer : 2300 gas, 실패시 에러를 발생, 주소 타입의 내장 함수
    3. call : 
        가변적인 gas, (gas값 지정 가능), 성공여부를 true 또는 false로 리턴
        재진입 (reEntrancy) 공격 위험성 있음. 2019년 12월 이후 call 사용을 추천

    payable
    payable은 이더 송수신을 할 때 필요한 키워드
    즉 send, transfer 로 이더를 보낼 때 주소는 payable이라는 키워드가 필요하다.
    payable은 주로 함수, 주소, 생성자에 붙여서 사용한다.
    call은 payable 필요 없다.

    msg.value
    msg.value는 송금보낸 이더의 값
    */
}