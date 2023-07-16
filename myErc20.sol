// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0;

contract myErc20 {

    event _transfer(address _from, address _to, uint _amount);
    string private tokenName; // Ether
    string private tokenSymbol; // ETH
    uint private tokenTotalSupply; // 발행 토큰 총량
    uint private tokenDecimal; // 1 ether = 10 ^18 wei --> 소수점 18개

    mapping(address => uint) private addressBalanceMap;


    constructor(string memory _name, string memory _symbol, uint _totalSupply, uint _decimal) {
        tokenName = _name;
        tokenSymbol = _symbol;
        tokenTotalSupply = _totalSupply;
        tokenDecimal = _decimal;
        mint(msg.sender, _totalSupply);
    }

    function getName() public view returns(string memory) {
        return tokenName;
    }

    function getSymbol() public view returns(string memory) {
        return tokenSymbol;
    }

    function getTotalSupply() public view returns(uint) {
        return tokenTotalSupply;
    }

    function getTokenDecimal() public view returns(uint) {
        return tokenDecimal;
    }

    function getBalance(address _addr) public view returns(uint) {
        return addressBalanceMap[_addr];
    }

    function mint(address _addr, uint amount) internal virtual { //public접근이면 아무나 민팅 가능해서 토큰 막 생성 가능, virtual로 재구현 가능
        addressBalanceMap[_addr] += amount;
        tokenTotalSupply += amount;
    }

    function transfer(address _to, uint _amount) public {
        require(addressBalanceMap[msg.sender] >= _amount, "Not enough token");
        addressBalanceMap[msg.sender] -= _amount;
        addressBalanceMap[_to] += _amount;

        emit _transfer(msg.sender, _to, _amount);
    }
}