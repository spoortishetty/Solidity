//SPDX-License-Identifier: MIT
pragma solidity 0.8.0;


contract MyCryptotoken {
    string public NAME = "IEEE SIESGST";
    string public SYMBOL = "IEEESIESGST";

    mapping(address => uint) balances;
    address deployer;
    uint256 private _totalSupply;

    constructor() {
        deployer = msg.sender;
        balances[deployer] = 1000000000 * 1e18;
    }

    function name() public view returns(string memory) {
        return NAME;
    }

    function symbol() public view returns(string memory) {
        return SYMBOL;
    }

    function decimals() public pure returns (uint) {
        return 18;
    }

    function totalSupply() public view returns(uint256) {
        return _totalSupply;
    }

    function balanceOf(address _owner) public view returns(uint) {
        return balances[_owner];
    }

    function transfer(address _to, uint256 _amount) public returns (bool) {
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
        return true;
    }

    function transferFrom(address _from, address _to, uint256 amount) public returns (bool) {
        balances[_from] -= amount;
        balances[_to] += amount;
        _approve(_from, _to, (allowances[_from][_to]) - (amount));
        return true;
    }

    mapping(address => mapping(address => uint)) allowances;

    function approve(address _spender, uint256 _value) public returns (bool){
        allowances[msg.sender][_spender] = _value;
        _approve(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint256){
       return allowances[_owner][_spender];
    }

    function increaseAllowance(address _spender, uint256 addedValue) public returns (bool) {
        address _owner = msg.sender;
        _approve(_owner, _spender, allowances[_owner][_spender] + (addedValue));
        return true;
    }

    function decreaseAllowance(address _spender, uint256 subtractedValue) public returns (bool) {
        address _owner = msg.sender;
        _approve(_owner, _spender, allowances[_owner][_spender] - (subtractedValue));
        return true;
    }

    function _approve(address owner, address spender, uint256 amount) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        allowances[owner][spender] = amount;
        
    }
}