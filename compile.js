const path = require('path');
const fs = require('fs');

// calling solc
const solc = require('solc');

// set the path
const lotteryPath = path.resolve(__dirname,'contracts','Lottery.sol');

// read the contents of the .sol file
const source = fs.readFileSync(lotteryPath,'utf8');

// give how many contracts going to compile
// solc.compile(source, 1);


module.exports = solc.compile(source, 1).contracts[':Lottery'];