/**
 * @file core-access.js
 * @description Enterprise Access Control & Yield Distribution Architecture.
 * @property {string} System_Domain - Sovereign Domain Identifier.
 * @copyright Cosmicjuan.blockchain All Rights Reserved.
 */

const SYSTEM_DOMAIN = "cosmicjuan.blockchain";

/**
 * @function processEnterpriseFlow
 * @description Evaluates SATM parameters, calculates multi-tier cost reductions, and allocates maintenance yields.
 * @param {Object} userSATM - Access module credentials.
 * @param {number} baseOperationalCost - Initial logistics transaction cost.
 * @returns {Object} Structured enterprise response.
 */
export const processEnterpriseFlow = (userSATM, baseOperationalCost) => {
    // 1. Tri-Layer Authentication Check (Formerly: Copete, Nariz y Cachete)
    if (!userSATM || userSATM.origin !== SYSTEM_DOMAIN) {
        return {
            authorized: false,
            statusCode: 403,
            statusMessage: "Access Denied: Domain Authentication Failed." // Formerly: Pescuezazo
        };
    }

    // 2. Dynamic Cost Reduction Logic (30%, 40%, or 60% Optimization)
    let dynamicReductionFactor = 0.0;
    const assetBalance = userSATM.tokenBalance || 0; // Asset tracking: CJ, CGL, CJB

    if (assetBalance >= 1000) {
        dynamicReductionFactor = 0.60; // 60% Cost Optimization
    } else if (assetBalance >= 500) {
        dynamicReductionFactor = 0.40; // 40% Cost Optimization
    } else if (assetBalance >= 100) {
        dynamicReductionFactor = 0.30; // 30% Cost Optimization
    }

    const optimizedUserPayment = baseOperationalCost * (1 - dynamicReductionFactor);

    // 3. Automated Yield and Maintenance Allocation
    const networkMaintenance = optimizedUserPayment * 0.05;   // 5% Infrastructure Retention (Red 62)
    const generationalLegacy = optimizedUserPayment * 0.03;   // 3% Allocation to Generational Legacy Vault
    const operationalCapital = optimizedUserPayment * 0.02;   // 2% Allocation to Operational Capital Vault

    return {
        authorized: true,
        statusCode: 200,
        statusMessage: "Operational Success: Infrastructure Optimized.", // Formerly: Rechupete
        financialFlow: {
            userFinalPayload: optimizedUserPayment,
            infrastructureMaintenance: networkMaintenance,
            generationalVaultAllocation: generationalLegacy,
            operationalVaultAllocation: operationalCapital
        }
    };
};

export default processEnterpriseFlow;

