import { Address } from '@frugalwizard/abi2ts-lib';
import { EthereumSetupContext, TestSetupContext } from '@frugalwizard/contract-test-helper';
import { IOrderbookDEXTeamTreasury } from '../../src/interfaces/IOrderbookDEXTeamTreasury';
import { createTreasuryUtilScenario, Treasury, TreasuryUtilContext, TreasuryUtilScenario } from './TreasuryUtil';

export type SafeFeeScenario = {
    readonly treasury: Treasury,
} & TreasuryUtilScenario<TestSetupContext & EthereumSetupContext & TreasuryUtilContext & {
    readonly treasury: Address,
    readonly expectedFee: bigint,
    execute(): Promise<bigint>;
}>;

export function createSafeFeeScenario({
    only,
    description,
    treasury,
    expectedFee,
}: {
    only?: boolean;
    description?: string;
    treasury: Treasury;
    expectedFee?: bigint;
}): SafeFeeScenario {
    return {
        treasury,

        ...createTreasuryUtilScenario({
            only,
            description: description || `get safeFee from ${treasury}`,

            async setup(ctx) {
                const treasuryAddress = ctx[treasury];
                const actualExpectedFee = expectedFee ?? await IOrderbookDEXTeamTreasury.at(treasuryAddress).fee(0n);

                ctx.addContext('treasury', treasury);
                ctx.addContext('expectedFee', actualExpectedFee);

                return {
                    ...ctx,
                    treasury: treasuryAddress,
                    expectedFee: actualExpectedFee,
                    execute: () => ctx.util.safeFee(treasuryAddress, 0n),
                };
            },
        }),
    };
}
