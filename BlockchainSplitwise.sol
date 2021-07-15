// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title BlockchainSplitwise
 * @dev Store & retrieve value in a variable
 */
contract BlockchainSplitwise {

    uint256 number;

    /**
     * @dev Add new IOU to database
     * @param creditor address of user giving the IOU to
     * @param amount value of the IOU being sent to creditor
     */
    function add_IOU(address creditor, uint32 amount) public {
        require (amount >= 0, "Amount should be a positive value.");
        
    }
    
    /**
     * @dev Return value of the debt of debtor to creditor
     * @return ret debt value of debtor to creditor
     */
    function lookup(address debtor, address creditor) public view returns (uint32 ret) {
        ret = 2; /* TODO: someshit */
    }

}