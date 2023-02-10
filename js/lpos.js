class Block {
    constructor(data, previousHash, stake, validator) {
        this.data = data;
        this.previousHash = previousHash;
        this.stake = stake;
        this.validator = validator;
        this.hash = this.calculateHash();
    }

    calculateHash() {
        return CryptoJS.SHA256(this.data + this.previousHash + this.stake + this.validator).toString();
    }
}

class Blockchain {
    constructor() {
        this.chain = [this.createGenesisBlock()];
        this.validators = [];
        this.blockTime = 5000;
    }

    createGenesisBlock() {
        return new Block("Genesis Block", "0", 0, "");
    }

    getLatestBlock() {
        return this.chain[this.chain.length - 1];
    }

    addBlock(newBlock) {
        newBlock.previousHash = this.getLatestBlock().hash;
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

    addValidator(validator, stake) {
        this.validators.push({
            address: validator,
            stake: stake
        });
    }

    selectValidator(stake) {
        let selectedValidator = "";
        let maxStake = 0;

        for (let i = 0; i < this.validators.length; i++) {
            if (this.validators[i].stake > maxStake) {
                selectedValidator = this.validators[i].address;
                maxStake = this.validators[i].stake;
            }
        }

        return selectedValidator;
    }

    validateBlock(block) {
        return block.validator === this.selectValidator(block.stake);
    }
}
