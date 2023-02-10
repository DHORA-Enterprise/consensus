class Block {
    constructor(data, previousHash) {
        this.data = data;
        this.previousHash = previousHash;
        this.hash = this.calculateHash();
        this.stake = 0;
    }

    calculateHash() {
        return CryptoJS.SHA256(this.data + this.previousHash + this.stake).toString();
    }
}

class Blockchain {
    constructor() {
        this.chain = [this.createGenesisBlock()];
    }

    createGenesisBlock() {
        return new Block("Genesis Block", "0");
    }

    getLatestBlock() {
        return this.chain[this.chain.length - 1];
    }

    addBlock(newBlock) {
        newBlock.previousHash = this.getLatestBlock().hash;
        newBlock.hash = newBlock.calculateHash();
        this.chain.push(newBlock);
    }

    isChainValid() {
        for (let i = 1; i < this.chain.length; i++) {
            const currentBlock = this.chain[i];
            const previousBlock = this.chain[i - 1];

            if (currentBlock.hash !== currentBlock.calculateHash()) {
                return false;
            }

            if (currentBlock.previousHash !== previousBlock.hash) {
                return false;
            }
        }
        return true;
    }

    stakeBlock(block, stake) {
        block.stake += stake;
        block.hash = block.calculateHash();
    }
}
