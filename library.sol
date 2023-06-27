// SPDX-License-Identifier: MIT
pragma solidity >= 0;

/*
library: 기존에 만들던 컨트랙트와 다른 종류의 컨트랙트
장점
	가스 소비 줄임 : 라이브러리는 배포할 필요가 없어 가스 소비가 없음
	재사용 : 다른 스마트 컨트랙트들에 사용 가능
	데이터 타입 적용 : 라이브러리의 기능들은 데이터 타입에 적용할 수 있기에 좀 더 쉽게 사용 가능함.
단점
	fallback 함수 불가
	상속 불가
	payable 함수 정의 불가
*/

library SafeMath {
    function add(uint8 a, uint8 b) internal pure returns(uint8) {
        require(a+b >= a, "SafeMath: addition overflow");
        require(a+b >= b, "SafeMath: addition overflow");
        return a + b;
    }
}

contract libraryEx {
    using SafeMath for uint8;
    uint8 public a;

    function becomeOverflow(uint8 _num1, uint8 _num2) public {
        a = _num1.add(_num2);
    }
}