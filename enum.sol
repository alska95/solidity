// SPDX-License-Identifier: MIT
pragma solidity >= 0;

/*
enum

첫번째 부터 0의 값을 가짐
uint8로 총 0~255까지 이름을 붙일 수 있다.

enum 이넘명 {
    이넘1, // 0
    이넘2, // 2
    ...
    이넘 256// 255
}
*/

contract enumEx {
    enum Light {
        TurnOn,
        TurnOff,
        Repair
    }

    Light public lightStatus;

    constructor() {
        lightStatus = Light.TurnOff;
    }

    event currentStatus(Light _lightStatus, uint _lightStatusInInt);

    function turnOn() public {
        require(lightStatus == Light.TurnOff, "Light must be off");
        lightStatus = Light.TurnOn;
        emit currentStatus(lightStatus, uint(lightStatus));
    }

        function turnOff() public {
        require(lightStatus == Light.TurnOn, "Light must be on");
        lightStatus = Light.TurnOff;
        emit currentStatus(lightStatus, uint(lightStatus));
    }
}