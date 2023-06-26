/*
생성자
    스마트 컨트랙트가 배포될 때 제일 먼저 작동하는 함수
    스마트 컨트랙트를 배포할 때 마다 특정한 값을 세팅해줌
    contract practice {
        constructor() {
        
        }
    }

    상속
        특정 스마트 컨트랙트의 모든 기능을 상속 받음
        상속을 주는 쪽 부모 스마트 컨트랙트
        상속을 받는 쪽 자식 스마트 컨트랙트
        constract practice is 스마트컨트랙트 명 {

        }

    오버라이딩
        상속받은 함수를 변경
        virtual : 부모 스마트 컨트랙트에 있는 오버라이딩할 함수에 지정
        override : 자식 스마트 컨트랙트에 있는 오버라이딩할 함수에 지정

    인스턴스화
        특정 스마트 컨트랙트를 인스턴스화하여 여러개 사용 가능
*/

// SPDX-License-Identifier: MIT
pragma solidity >= 0;

contract fathersWallet {
    uint public money;
    constructor (uint _money) {
        money = _money;
    }

    function addMoney(uint _money) public {
        money = money + _money;
    }

    function changeMoney(uint _money) public virtual {
        money = _money;
    }
}

contract sonWallet is fathersWallet {
    constructor (uint _money) fathersWallet(_money){}

        function changeMoney(uint _money) public override  {
        money = _money + 10;
    }
}

contract son2Wallet is fathersWallet(1000) {

        function changeMoney(uint _money) public override  {
        money = _money + 10;
    }
}

contract fatherInstance {
    fathersWallet wallet1= new fathersWallet(1000);
    fathersWallet wallet2= new fathersWallet(10000);
    fathersWallet wallet3= new fathersWallet(100000);

    function addWalletAll(uint _money1, uint _money2, uint _money3) public {
        wallet1.addMoney(_money1);
        wallet2.addMoney(_money2);
        wallet3.addMoney(_money3);
    }
}