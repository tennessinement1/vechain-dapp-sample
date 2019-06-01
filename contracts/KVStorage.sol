pragma solidity ^0.4.24;

library SafeMath {

    /**
    * @dev Multiplies two numbers, throws on overflow.
    */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    /**
    * @dev Integer division of two numbers, truncating the quotient.
    */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return a / b;
    }

    /**
    * @dev Subtracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
    */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    /**
    * @dev Adds two numbers, throws on overflow.
    */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}


/**
 * Contract that implements key-value based data table. 
 */
contract KVStorage {

    string public namespace;
    uint256 public keyCount;
    
    // Key-Value Storage
    mapping(bytes32 => bytes32) _keyToValue;

    constructor(string _namespace) public {
        require(bytes(_namespace).length > 0, "_namespace required");
        namespace = _namespace;
    }

    function get(bytes32 key) public view returns(bytes32) {
        return _keyToValue[key];
    }

    function set(bytes32 key, bytes32 value) public {
        bytes32 oldValue = _keyToValue[key];
        if(value == 0) {
            if(oldValue != 0) keyCount--;
        } else {
            if(oldValue == 0) keyCount++;
        }

        _keyToValue[key] = value;
    }

}

