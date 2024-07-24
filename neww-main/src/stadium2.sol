//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Manager {
    error NotEnoughEther();
    error TicketNotAvailable();
    error SeatNotOwned();
    error TransactionFailed();

    // enum TicketStatus {
    //     Available,
    //     Sold,
    //     NotIssued
    // }
    struct Ticket {
        uint256 ticketId;
        uint256 price;
        address owner;
        // uint256 buyingTime;
        bool status;
    }
    Ticket[] public tickets;
    mapping(uint256 => Ticket) public ticketIdToTicket;

    uint256 public ticketCount;

    constructor() {}

    function issueTicket(uint256 _ticketId, uint256 _price) public {
        Ticket memory ticket = Ticket(
            _ticketId,
            _price,
            address(this),
            // 0,
            true
        );
        tickets.push(ticket);
        ticketIdToTicket[_ticketId] = ticket;
    }

    function buyTicket(uint256 ticketId) public payable {
        if (msg.value != ticketIdToTicket[ticketId].price) {
            revert NotEnoughEther();
        }
        if (ticketIdToTicket[ticketId].status != true) {
            revert TicketNotAvailable();
        }

        bool success = payable(ticketIdToTicket[ticketId].owner).send(
            msg.value
        );

        if (!success) {
            revert TransactionFailed();
        }
        ticketIdToTicket[ticketId].owner = msg.sender;
        ticketIdToTicket[ticketId].status = false;
        // ticketIdToTicket[ticketId].buyingTime = block.timestamp;
    }

    function sellTicket(uint256 ticketId, uint256 price) public {
        if (ticketIdToTicket[ticketId].owner != msg.sender) {
            revert SeatNotOwned();
        }
        ticketIdToTicket[ticketId].status = true;
        ticketIdToTicket[ticketId].price = price;
    }

    function getTicketPrice(uint256 ticketId) public view returns (uint256) {
        return ticketIdToTicket[ticketId].price;
    }

    function cancelTicket(uint256 ticketId) public {
        if (ticketIdToTicket[ticketId].owner != msg.sender) {
            revert SeatNotOwned();
        }

        bool success = payable(msg.sender).send(
            ticketIdToTicket[ticketId].price
        );
        if (!success) {
            revert TransactionFailed();
        }
        ticketIdToTicket[ticketId].status = true;
        ticketIdToTicket[ticketId].owner = address(this);
        // ticketIdToTicket[ticketId].buyingTime = 0;
    }

    function getTicketOwner(uint256 ticketId) public view returns (address) {
        return ticketIdToTicket[ticketId].owner;
    }
}
