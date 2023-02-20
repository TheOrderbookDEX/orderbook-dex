import { parseValue } from '@frugalwizard/abi2ts-lib';
import { createSafeFeeScenario } from '../scenario/safeFee';
import { Treasury } from '../scenario/TreasuryUtil';

export const safeFeeScenarios = [
    createSafeFeeScenario({
        treasury: Treasury.FIRST,
    }),

    createSafeFeeScenario({
        treasury: Treasury.SECOND,
    }),

    createSafeFeeScenario({
        treasury: Treasury.THIRD,
    }),

    createSafeFeeScenario({
        treasury: Treasury.OTTFEE,
        expectedFee: parseValue('0.005'),
    }),

    createSafeFeeScenario({
        treasury: Treasury.OTTGAS,
        expectedFee: 0n,
    }),

    createSafeFeeScenario({
        treasury: Treasury.ERRORED,
        expectedFee: 0n,
    }),

    createSafeFeeScenario({
        treasury: Treasury.INVALID,
        expectedFee: 0n,
    }),
];
