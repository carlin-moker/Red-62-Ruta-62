import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("CosmicJuanModule", (m) => {
  const cosmicJuan = m.contract("CosmicJuan");

  return { cosmicJuan };
});
