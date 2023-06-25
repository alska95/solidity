// SPDX-License-Identifier: MIT
pragma solidity >= 0;

contract lec4 {

    /*
    function 이름 () public returns(){ // (public, private, internal, external) 변경가능.
        //내용
    }

    public : 외부/내부 접근 가능 (GETTER자동 생성)
    external : 외부 접근만 가능 (this  키워드 사용 시 내부 접근 가능)
    private : 내부 접근만 가능
    internal : 내부 접근만 가능하나, 상속 받은 스마트 컨트랙트는 외부 접근 가능능
    */

    uint public a = 1;

    function fun1() public {
        this.fun2(a);
    }

    function fun2(uint _num) external returns(uint){
        return 5 + _num;
    }

    function fun4(uint _num) public returns(uint) {
        return a;
    }

}