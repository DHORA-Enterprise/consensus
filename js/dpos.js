class Block {
    constructor(data, previousHash, stake) {
        this.data = data;
        this.previousHash = previousHash;
        this.stake = stake;
        this.hash = this.calculateHash();
    }

    calculateHash() {
        return CryptoJS.SHA256(this.data + this.previousHash + this.stake).toString();
    }
}

class Blockchain {
    constructor() {
        this.chain = [this.createGenesisBlock()];
        this.validators = [];
        this.blockTime = 5000;
    }

    createGenesisBlock() {
        return new Block("Genesis Block", "0", 0);
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

    selectValidators() {
        this.validators.sort((a, b) => (a.stake > b.stake) ? -1 : 1);
        return this.validators.slice(0, Math.floor(this.validators.length / 3));
    }

    validateBlock(block) {
        const selectedValidators = this.selectValidators();
        let validationCount = 0;

        for (let i = 0; i < selectedValidators.length; i++) {
            if (selectedValidators[i].address === block.validator) {
                validationCount++;
            }
        }

        return validationCount >= Math.floor(selectedValidators.length / 3);
    }
}
