struct Block {
    var data: String
    var previousHash: String
    var validator: String
    var hash: String

    init(data: String, previousHash: String, validator: String) {
        self.data = data
        self.previousHash = previousHash
        self.validator = validator
        self.hash = calculateHash()
    }

    func calculateHash() -> String {
        let dataString = data + previousHash + validator
        let dataData = dataString.data(using: .utf8)!
        let hash = SHA256.hash(data: dataData)
        return hash.map { String(format: "%02x", $0) }.joined()
    }
}

class Blockchain {
    var chain: [Block]
    var validators: [String]
    var blockTime: Double
    var delegateStake: Double

    init() {
        chain = [createGenesisBlock()]
        validators = []
        blockTime = 5000
        delegateStake = 0
    }

    func createGenesisBlock() -> Block {
        return Block(data: "Genesis Block", previousHash: "0", validator: "")
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

    func addValidator(validator: String) {
        validators.append(validator)
    }

    func delegateStakeToValidator(stake: Double, validator: String) {
        delegateStake += stake
        validators.append(validator)
    }

    func selectValidator() -> String {
        let delegateStakeArray = Array(repeating: delegateStake, count: validators.count)
        let selectedValidatorIndex = WeightedRandom.random(weights: delegateStakeArray)
        return validators[selectedValidatorIndex]
    }

    func validateBlock(block: Block) -> Bool {
        return block.validator == selectValidator()
    }
}
