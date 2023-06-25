// SPDX-License-Identifier: MIT
pragma solidity >= 0;

contract lec5 {
    /*
    저장 공간
    1. storage
        영속적인 읽고 쓰기가 가능한 저장 공간
        가스 비용이 비싸다
        함수의 외부나 함수에서 저장한다.
    
    2. memory
        휘발적인 읽고 쓰기가 가능한 저장 공간
        함수의 내부에 정의된 변수, 매개변수, 반환값 등이 사용된다.

    3. colladata
        읽기 가능한 공간
        external의 매개변수에 적용된다.

    4. stack
        EVM(Ethereum Virtual Machine)에서 stack data를 관리할 때 쓰는 영역
        1024mb제한한
    
    함수의 모디파이어 : 함수의 행동을 제한
    pure, view, payable

    pure: 순수하게 함수안에 있는 변수만 사용할 때
    view: 함수 밖에 있는 변수, 함수를 읽어올 때때
    */

    uint public a = 1;

    function fun1() public view returns(uint) {
        return a;
    }

    function fun2() public pure returns(uint) {
        uint b= 4;
        return b;
    }

    function fun3() public returns(uint) {
        a = 3; //외부 변수 변경되어 pure, view사용 불가가
        return a;
    }

    function fun4(string memory _str) public pure returns(string memory) { // 참조 타입은 데이터를 따로 지정해줘야함
        return _str;
    }

    /*
    event
        다른 프로그래밍 언어의 print 함수 처럼 특정한 값을 출력
        블록체인의 특정 블로겡 값을 저장
        함수 내부에서만 사용 가능, emit 키워드 사용
        event 이벤트명(자료형 변수명)
            event Info(string name, uint256 money);
    
    */

    event Info(string name, uint256 money);

    function eventEmit(string memory name, uint256 money) public {
        emit Info(name, money);
    }
}
