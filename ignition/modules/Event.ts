import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const TicketingSystemModule = buildModule("TicketingSystemModule", (m) => {

    const ticket = m.contract("TicketingSystem");

    return { ticket };
});

export default TicketingSystemModule;
//0x1d6a3C4627C225445aC6b23262e1123A423f189b