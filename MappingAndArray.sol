// SPDX-License-Identifier: MIT
pragma solidity >= 0;

contract MappingAndArray {
    /*
    매핑
        키와 값으로 구성
        length 없음
        mapping(키 자료형 => 값 자료형) 가시성 지정자 변수명;
        mapping(uint => uint) public a;
    */

    mapping(address => uint) public a;

    function addMapping(address _key, uint _value) public {
        a[_key] = _value;
    }

    function getMapping(address _key) public view returns(uint) {
        return a[_key];
    }

    function deleteMapping(address _key) public {
        delete(a[_key]); // == a[_key] = 0;
    }

    function changeMapping(address _key, uint _value) public {
        a[_key] = _value;
    }

    /*
    배열
        length가 있음
        자료형[] 가시성 지정자 변수명;
        uint256[] public b;
        uint256[10] public ageFixedSizeArray;
        string[] public nameArray = ["kal", "John", "Hwang"]    
    */

    uint256[] public exArray = [1,2,3];
    function addArray(uint _value) public {
        exArray.push(_value);
    }

    function getArray(uint _index) public view returns(uint) {
        return exArray[_index];
    }

    /*
    구조체 (struct)
    자신만의 자료형
    struct 구조체명 {
        자료형 변수명,
        자료형 변수명
    }
    */

    struct Human {
        string name;
        uint age;
    }

    mapping(uint256 => Human) public humanMapping;
    Human[] public humanArray;

    function createHuman(string memory name, uint age) public returns (Human memory) {
        Human memory _human = Human(name, age);
        humanArray.push(_human);
        humanMapping[age] = _human;
        return _human;
    }
}