// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title BlockchainSplitwise
 * @dev Store & IOUs for a debt handler DApp
 */
contract BlockchainSplitwise {
    
    struct IOU {
        address debtor;
        address creditor;
        uint32 amount;
        uint256 time;
    }

    IOU[] private _IOUs;
    address[] public users;
    mapping (address => bool) private is_in;

    /**
     * @dev Add new IOU to database
     * @param creditor address of user giving the IOU to
     * @param amount value of the IOU being sent to creditor
     */
    function add_IOU(address creditor, uint32 amount) public {
        require (amount >= 0, "Amount should be a positive value.");
        _IOUs.push(IOU(msg.sender, creditor, amount, block.timestamp));
        if (is_in[msg.sender] == false){
            users.push(msg.sender);
            is_in[msg.sender] = true;
        }
        if (is_in[creditor] == false){
            users.push(creditor);
            is_in[creditor] = true;
        }
    }
    
    /**
     * @dev Return value of the debt of debtor to creditor
     * @return ret debt value of debtor to creditor
     */
    function lookup(address debtor, address creditor) public view returns (uint32 ret) {
        ret = 0;
        for (uint i=0; i < _IOUs.length; i++) {
            if (_IOUs[i].debtor == debtor && _IOUs[i].creditor == creditor){
                ret += _IOUs[i].amount;
            }
        }
    }
    
    /**
     * @dev get total owed of user
     * @param user address of user getting total owed for
     * @return ret owed value of the user
     */
    function get_total_owed(address user) public view returns (uint32 ret) {
        ret = 0;
        for (uint i=0; i < _IOUs.length; i++) {
            if (_IOUs[i].debtor == user){
                ret += _IOUs[i].amount;
            }
        }
    }

    /**
     * @dev get last active time of user
     * @param user address of user getting last active of
     * return ret last active timestamp of user
     */
    function get_last_active(address user) public view returns (uint256 ret) {
        ret = 0;
        for (uint i=0; i < _IOUs.length; i++) {
            if (_IOUs[i].debtor == user){
                ret = _IOUs[i].time;
            }
        }
    }
    
    /**
     * @dev get full user list
     */
    function get_users() public view returns (address[] memory){
        return users;
    }

}