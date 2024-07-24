//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Manager {
    error NotEnoughEther();
    error TicketNotAvailable();
    error SeatNotOwned();
    error TransactionFailed();
    error CancellationTimeExceeded();

    enum TicketStatus {
        Available,
        Sold,
        NotIssued
    }
    struct Ticket {
        uint256 ticketId;
        uint256 price;
        address owner;
        uint256 buyingTime;
        TicketStatus status;
    }
    // Ticket[] public tickets;
    mapping(uint256 => Ticket) public ticketIdToTicket;

    // uint256 public ticketCount = tickets.length;
    uint256 public immutable CANCELLATION_TIME = 6 hours;

    event TicketIssued(uint256 indexed ticketId, uint256 indexed price);
    event TicketBought(uint256 indexed ticketId, address indexed buyer);
    event TicketForSale(uint256 indexed ticketId, uint256 indexed price);
    event TicketCancelled(uint256 indexed ticketId);
    address public _owner;

    constructor() {
        _owner = msg.sender;
    }

    // Ensure the contract can receive ether
    receive() external payable {}

    function issueTicket(uint256 _ticketId, uint256 _price) public {
        Ticket memory ticket = Ticket(
            _ticketId,
            _price,
            address(this),
            0,
            TicketStatus.Available
        );
        // tickets.push(ticket);
        ticketIdToTicket[_ticketId] = ticket;

        // ticketCount++;
        emit TicketIssued(_ticketId, _price);
    }

    function buyTicket(uint256 ticketId) public payable {
        if (ticketIdToTicket[ticketId].status != TicketStatus.Available) {
            revert TicketNotAvailable();
        }
        if (msg.value < ticketIdToTicket[ticketId].price) {
            revert NotEnoughEther();
        }

        bool success = payable(ticketIdToTicket[ticketId].owner).send(
            msg.value
        );

        if (!success) {
            revert TransactionFailed();
        }
        ticketIdToTicket[ticketId].owner = msg.sender;
        ticketIdToTicket[ticketId].status = TicketStatus.Sold;
        ticketIdToTicket[ticketId].buyingTime = block.timestamp;
        emit TicketBought(ticketId, msg.sender);
    }

    function sellTicket(uint256 ticketId, uint256 price) public {
        if (ticketIdToTicket[ticketId].owner != msg.sender) {
            revert SeatNotOwned();
        }
        ticketIdToTicket[ticketId].status = TicketStatus.Available;
        ticketIdToTicket[ticketId].price = price;
        emit TicketForSale(ticketId, price);
    }

    function getTicketPrice(uint256 ticketId) public view returns (uint256) {
        return ticketIdToTicket[ticketId].price;
    }

    function cancelTicket(uint256 ticketId) public {
        address prevOwner = ticketIdToTicket[ticketId].owner;
        if (
            keccak256(abi.encode(ticketIdToTicket[ticketId].owner)) !=
            keccak256(abi.encode(msg.sender))
        ) {
            revert SeatNotOwned();
        }
        if (
            block.timestamp - ticketIdToTicket[ticketId].buyingTime >
            CANCELLATION_TIME
        ) {
            revert CancellationTimeExceeded();
        }
        ticketIdToTicket[ticketId].status = TicketStatus.Available;
        ticketIdToTicket[ticketId].owner = address(this);
        refundOnCancellation(prevOwner, ticketId);
    }

    function refundOnCancellation(address owner, uint256 ticketId) public {
        (bool sent, ) = owner.call{
            value: (9 * ticketIdToTicket[ticketId].price) / 10
        }("");
        if (!sent) {
            revert TransactionFailed();
        }
        emit TicketCancelled(ticketId);
    }

    // function getticketCount() public view returns (uint256) {
    //     return ticketCount;
    // }

    function getTicketOwner(uint256 ticketId) public view returns (address) {
        return ticketIdToTicket[ticketId].owner;
    }

    function getTickerPrice(uint256 ticketId) public view returns (uint256) {
        return ticketIdToTicket[ticketId].price;
    }

    function getTicketBuyingTime(
        uint256 ticketId
    ) public view returns (uint256) {
        return ticketIdToTicket[ticketId].buyingTime;
    }

    function getTicketStatus(
        uint256 ticketId
    ) public view returns (TicketStatus) {
        return ticketIdToTicket[ticketId].status;
    }

    function getOwner() public view returns (address) {
        return _owner;
    }
}
