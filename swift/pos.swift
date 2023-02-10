struct Block {
    var data: String
    var previousHash: String
    var validator: String
    var stake: Double
    var hash: String

    init(data: String, previousHash: String, validator: String, stake: Double) {
        self.data = data
        self.previousHash = previousHash
        self.validator = validator
        self.stake = stake
        self.hash = calculateHash()
    }

    func calculateHash() -> String {
        let dataString = data + previousHash + validator + String(stake)
        let dataData = dataString.data(using: .utf8)!
        let hash = SHA256.hash(data: dataData)
        return hash.map { String(format: "%02x", $0) }.joined()
    }
}

class Blockchain {
    var chain: [Block]
    var blockTime: Double
    var validators: [String: Double]

    init() {
        chain = [createGenesisBlock()]
        blockTime = 5000
        validators = [:]
    }

    func createGenesisBlock() -> Block {
        return Block(data: "Genesis Block", previousHash: "0", validator: "", stake: 0)
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
        validators[validator] = stake
    }

    func selectValidator() -> String {
        let validatorsStakeArray = Array(validators.values)
        let selectedValidatorIndex = WeightedRandom.random(weights: validatorsStakeArray)
        return Array(validators.keys)[selectedValidatorIndex]
    }

    func validateBlock(block: Block) -> Bool {
        return block.validator == selectValidator()
    }
}
