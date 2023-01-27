import chai from 'chai';
import chaiAsPromised from 'chai-as-promised';
import { expect } from 'chai';
import { DefaultOverrides } from '@frugal-wizard/abi2ts-lib';
import { safeFeeScenarios } from './scenarios/safeFee';

chai.use(chaiAsPromised);

DefaultOverrides.gasLimit = 5000000;

describe('call', () => {
    for (const scenario of safeFeeScenarios) {
        scenario.describe(({ it }) => {
            it('should return expected fee', async (test) => {
                expect(await test.execute())
                    .to.be.equal(test.expectedFee);
            });
        });
    }
});
