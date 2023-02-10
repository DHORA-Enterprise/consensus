struct Block {
    var data: String
    var previousHash: String
    var stake: Double
    var validator: String
    var hash: String

    init(data: String, previousHash: String, stake: Double, validator: String) {
        self.data = data
        self.previousHash = previousHash
        self.stake = stake
        self.validator = validator
        self.hash = calculateHash()
    }

    func calculateHash() -> String {
        let dataString = data + previousHash + String(stake) + validator
        let dataData = dataString.data(using: .utf8)!
        let hash = SHA256.hash(data: dataData)
        return hash.map { String(format: "%02x", $0) }.joined()
    }
}

class Blockchain {
    var chain: [Block]
    var validators: [(address: String, stake: Double)]
    var blockTime: Double

    init() {
        chain = [createGenesisBlock()]
        validators = []
        blockTime = 5000
    }

    func createGenesisBlock() -> Block {
        return Block(data: "Genesis Block", previousHash: "0", stake: 0, validator: "")
    }

    func getLatestBlock() -> Block {
        return chain[chain.count - 1]
    }

    func addBlock(newBlock: Block) {
        newBlock.previousHash = getLatestBlock().hash
        chain.append(newBlock)
    }

    func isChainValid() -> Bool {
        for i in 1..<chain.count {
            let currentBlock = chain[i]
            let previousBlock = chain[i - 1]

            if currentBlock.hash != currentBlock.calculateHash() {
                return false
            }

            if currentBlock.previousHash != previousBlock.hash {
                return false
            }
        }
        return true
    }

    func addValidator(validator: String, stake: Double) {
        validators.append((address: validator, stake: stake))
    }

    func selectValidator(stake: Double) -> String {
        var selectedValidator = ""
        var maxStake = 0.0

        for validator in validators {
            if validator.stake > maxStake {
                selectedValidator = validator.address
                maxStake = validator.stake
            }
        }

        return selectedValidator
    }

    func validateBlock(block: Block) -> Bool {
        return block.validator == selectValidator(stake: block.stake)
    }
}
