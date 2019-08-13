pragma solidity ^0.5.0;

import 'openzeppelin-solidity/contracts/ownership/Ownable.sol';


/**
 *  HashValue contract
 *      This Smart contract allows for the association of a hash with an Ethereum
 *  address.  One hash can be associate with a single address, one time only.
 *      Contract owner can update associations. 
 *      Emits a HashAdded event when an association is added / changed.
 */
contract HashValue is Ownable {

    event HashAdded(address indexed from, uint256 hashData);

    mapping (uint256 => address) private _hashValues;
    mapping (address => uint256) private _associations;


    /** 
     * @return whether or not the association was successful
     */
    function addHash(uint256 hashData) public returns (bool) {
        if ((!isRegistered(hashData)) && (!isAssociated(msg.sender))) {
        	_hashValues[hashData] = msg.sender;
        	emit HashAdded(msg.sender, hashData);
        	return true;
        }
        else {
            return false;
        }
    }

    /**
     * @return the address associated with the registered hash
     */
    function getHashOwner(uint256 hashData) public view returns (address) {
    	return _hashValues[hashData];
    }

    /**
     * @return true if the hash data specified has been registered
     */
    function isRegistered(uint256 hashData) public view returns (bool) {
        return _isHashAssociated(hashData);
    }

    /**
     * @return true if the address specified has registered a hash
     */
    function isAssociated(address addr) public view returns (bool) {
        return _isAddressAssociated(addr);
    }

    /**
     * @notice onlyOwner function that bypasses existence checks to set hash
     * for an address.
     */
    function setHash(address hashOwner, uint256 hashData) public onlyOwner {
        _setHashValueForAddress(hashData, hashOwner);
    }


    /**
     * @return whether or not the hash specified has been registered
     */
    function _isHashAssociated(uint256 hashData) private view returns (bool) {
        return _hashValues[hashData] != address(0x0);
    }

    /** 
     * @return whether or not the address specified has registered a hash
     */
    function _isAddressAssociated(address addr) private view returns (bool) {
        return _associations[addr] != uint256(0);
    }

    /**
     * @notice internal function to set mappings and emit event
     */
    function _setHashValueForAddress(uint256 hashData, address addr) private {
        _hashValues[hashData] = addr;
        _associations[addr] = hashData;

        emit HashAdded(addr, hashData);
    }

}