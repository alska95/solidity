// SPDX-License-Identifier: MIT
pragma solidity >= 0;

/*
메타마스크
    메타마스크란 이더리움과 상호작용 하는데 사용되는 소프트웨어 암호지갑이다.
    이를 통해 사용자는 브라우저 확장 프로그램이나 모바일 앱을 통해 이더리움 지갑에 액세스할 수 있으며,
    이를 통해 분산 애플리케이션과 상호작용 할수 있다.

크롬 확장 프로그램으로 사용 가능
    sepolia로 실습 진행 -> 테스트 이더 지급 받고 etherscan에서 조회 가능

아래 스마트 컨트랙트를 sepolia에 배포
*/
contract metamask {
    event Transfer(address _from, address _to, uint amount);

    receive() external payable {

    }

    function sendEther() public payable {
        payable(address(this)).transfer(msg.value);
        emit Transfer(msg.sender, address(this), msg.value);
    }
}