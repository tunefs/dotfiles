#!/usr/bin/env node

const readline = require('readline');

function read(rl) {
    return new Promise((resolve, reject) => {
        rl.question('', (str) => {
            resolve(str);
        });
    });
}

async function main() {
    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });

    while (true) {
        const v = eval(await read(rl));
        if (v) {
            const hex = v.toString(16);
            const oct = v.toString(8);
            const dec = v.toString(10);
            console.log(`0x${hex}\t0${oct}\t${dec}`);
        }
    }
}

main();

// vi:et:sw=4:
