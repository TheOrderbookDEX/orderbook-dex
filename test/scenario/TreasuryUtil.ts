import { Address, parseValue } from '@frugal-wizard/abi2ts-lib';
import { createEthereumScenario, EthereumScenario, EthereumSetupContext, TestSetupContext } from '@frugal-wizard/contract-test-helper';
import { OrderbookDEXTeamTreasuryErroredMock } from '../../src/testing/OrderbookDEXTeamTreasuryErroredMock';
import { OrderbookDEXTeamTreasuryMock } from '../../src/testing/OrderbookDEXTeamTreasuryMock';
import { OrderbookDEXTeamTreasuryOTTGasMock } from '../../src/testing/OrderbookDEXTeamTreasuryOTTGasMock';
import { OrderbookDEXTeamTreasuryUtilTester } from '../../src/testing/OrderbookDEXTeamTreasuryUtilTester';

export enum Treasury {
    FIRST   = 'firstTreasury',
    SECOND  = 'secondTreasury',
    THIRD   = 'thirdTreasury',
    OTTFEE  = 'ottFeeTreasury',
    OTTGAS  = 'ottGasTreasury',
    ERRORED = 'erroredTreasury',
}

type Treasuries = {
    [orderbook in Treasury]: Address;
}

export type TreasuryUtilScenario<Context> = EthereumScenario<Context>;

export type TreasuryUtilContext = {
    readonly util: OrderbookDEXTeamTreasuryUtilTester;
} & Treasuries;

export function createTreasuryUtilScenario<Context>({
    only,
    description,
    setup,
}: {
    only?: boolean;
    description: string;
    setup(ctx: TestSetupContext & EthereumSetupContext & TreasuryUtilContext): Context | Promise<Context>;
}): TreasuryUtilScenario<Context> {
    return {
        ...createEthereumScenario({
            only,
            description,

            async setup(ctx) {
                const util = await OrderbookDEXTeamTreasuryUtilTester.deploy();
                const firstTreasury   = (await OrderbookDEXTeamTreasuryMock.deploy(0n)).address;
                const secondTreasury  = (await OrderbookDEXTeamTreasuryMock.deploy(parseValue('0.001'))).address;
                const thirdTreasury   = (await OrderbookDEXTeamTreasuryMock.deploy(parseValue('0.002'))).address;
                const ottFeeTreasury  = (await OrderbookDEXTeamTreasuryMock.deploy(parseValue('0.0051'))).address;
                const ottGasTreasury  = (await OrderbookDEXTeamTreasuryOTTGasMock.deploy()).address;
                const erroredTreasury = (await OrderbookDEXTeamTreasuryErroredMock.deploy()).address;
                return setup({
                    ...ctx,
                    util,
                    firstTreasury,
                    secondTreasury,
                    thirdTreasury,
                    ottFeeTreasury,
                    ottGasTreasury,
                    erroredTreasury,
                });
            },
        })
    };
}
