/*
 * Copyright IBM Corp. All Rights Reserved.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

'use strict';

const { Contract } = require('fabric-contract-api');
const date = new Date().toLocaleDateString();



class Fabbag extends Contract {

    async initLedger(ctx) {
        console.info('============= START : Initialize Ledger ===========');
        const bags = [
            {
                flight: 'fr00585',
                date: date,
                owner: 'IDowner',
                id: 'ID'
            },
        ];

        for (let i = 0; i < bags.length; i++) {
            bags[i].docType = 'bag';
            await ctx.stub.putState('bag' + i, Buffer.from(JSON.stringify(bags[i])));
            console.info('Added <--> ', bags[i]);
        }
        console.info('============= END : Initialize Ledger ===========');
    }

    async querybag(ctx, bagNumber) {
        const bagAsBytes = await ctx.stub.getState(bagNumber); // get the bag from chaincode state
        if (!bagAsBytes || bagAsBytes.length === 0) {
            throw new Error(`${bagNumber} does not exist`);
        }
        console.log(bagAsBytes.toString());
        return bagAsBytes.toString();
    }

    
    async createbag(ctx, bagNumber, flight, owner) {
        console.info('============= START : Create bag ===========');

        const bag = {
            docType: 'bag',
            flight,
            date: date,
            owner,
            status : "Int"
        };

        await ctx.stub.putState (bagNumber, Buffer.from(JSON.stringify(bag)));
        console.info('============= END : Create bag ===========');
    }

 

    async queryAllBags(ctx) {
        const startKey = '';
        const endKey = '';
        const allResults = [];
        for await (const {key, value} of ctx.stub.getStateByRange(startKey, endKey)) {
            const strValue = Buffer.from(value).toString('utf8');
            let record;
            try {
                record = JSON.parse(strValue);
            } catch (err) {
                console.log(err);
                record = strValue;
            }
            allResults.push({ Key: key, Record: record });
        }
        console.info(allResults);
        return JSON.stringify(allResults);
    }
	

    async removeBag(ctx, bagNumber){
        console.info('============= START : removeBag ===========')

        const bagAsBytes = await ctx.stub.getState(bagNumber);
        if (!bagAsBytes || bagAsBytes.length === 0) {
            throw new Error(`${bagNumber} does not exist`);
        }

        const bag = JSON.parse(bagAsBytes.toString());
        await ctx.stub.deleteState(bagNumber,Buffer.from(JSON.stringify(bag)));

        console.info('============= END : removeBag ===========')

    }
    

}

module.exports = Fabbag;
