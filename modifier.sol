// SPDX-License-Identifier: MIT
pragma solidity >= 0;

/*
함수에 적용을 하여, 함수의 행위를 제한
    1. 매개 변수가 잇는 모디파이어
    modifier 모디파이어 이름(자료형 매개변수이름) {
        //모디파이어 로직
        _;
    }

    2. 매개 변수가 없는 모디파이어
    modifier 모디파이어 이름 {
        //모디파이어 로직
        _;
    }


*/

contract modifierPractice {
    modifier ageLimit(uint256 _age) {
        require(_age > 18, "age under 18");
        _; //함수의 시작시점
    }

    function buyCigarette5(uint256 _age) public pure ageLimit(_age) returns (string memory) {
        return "Your payment is succeeded";
    }
}