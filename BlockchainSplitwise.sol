// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title BlockchainSplitwise
 * @dev Store & retrieve value in a variable
 */
contract BlockchainSplitwise {

    mapping (address => mapping (address => uint32)) private _IOUs;

    /**
     * @dev Add new IOU to database
     * @param creditor address of user giving the IOU to
     * @param amount value of the IOU being sent to creditor
     */
    function add_IOU(address creditor, uint32 amount) public {
        require (amount >= 0, "Amount should be a positive value.");
        _IOUs[msg.sender][creditor] += amount;
    }
    
    /**
     * @dev Return value of the debt of debtor to creditor
     * @return ret debt value of debtor to creditor
     */
    function lookup(address debtor, address creditor) public view returns (uint32 ret) {
        ret = _IOUs[debtor][creditor];
    }
    
    // function testt(address abs) public returns (uint32) {
    //     add_IOU(abs, 22);
    //     add_IOU(abs, 1);
    //     return lookup(msg.sender, abs);
    // }

}