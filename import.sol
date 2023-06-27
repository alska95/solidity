// SPDX-License-Identifier: MIT
pragma solidity >= 0.6.0 < 0.8.0;
/*
import: 외부에 있는 스마트 컨트랙트, 라이브러리를 가져올 때 사용한다.
*/

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/docs-v3.x/contracts/math/SafeMath.sol";

contract importEx{
    using SafeMath for uint;
    uint public a = 0;
    uint public max = 2**256-1;
    function becomeOverflow(uint _num1, uint _num2) public {
        a = _num1.add(_num2);
    }
}