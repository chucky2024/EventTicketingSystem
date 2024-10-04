// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract TicketingSystem {
    struct Event {
        string name;
        uint256 ticketPrice;
        uint256 totalTickets;
        uint256 soldTickets;
    }

    mapping(bytes32 => Event) public events;

    event EventCreated(bytes32 indexed eventId, string name, uint256 ticketPrice, uint256 totalTickets);
    event TicketPurchased(bytes32 indexed eventId, address indexed buyer);

    function createEvent(bytes32 eventId, string memory name, uint256 ticketPrice, uint256 totalTickets) public {
        events[eventId] = Event(name, ticketPrice, totalTickets, 0);
        emit EventCreated(eventId, name, ticketPrice, totalTickets);
    }

    function purchaseTicket(bytes32 eventId) public payable {
        Event storage eventDetails = events[eventId];
        require(msg.value == eventDetails.ticketPrice, "Incorrect ticket price");
        require(eventDetails.soldTickets < eventDetails.totalTickets, "Tickets sold out");

        eventDetails.soldTickets++;
        emit TicketPurchased(eventId, msg.sender);
    }
}
