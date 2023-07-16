// SPDX-License-Identifier: MIT
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
pragma solidity >= 0.7.0 < 0.9.0;

contract myToken is ERC20{
    constructor(string memory _name, string memory _symbol, uint _totalTokenSupply) ERC20(_name, _symbol) {
        _mint(msg.sender, _totalTokenSupply * 10 ** decimals());
    }
}

/*
transFrom(a, b)이 가능 하려면
a의 token을 c가 b에게 보내는것 이기 때문에
c가 a로부터 approve받을 필요가 있다.

approve(sender, amount)함수를 이용하여 권한을 받는다.
erc20 내부에서 _allowances[owner][spender] => amount 형태로 관리되고 있음.
*/