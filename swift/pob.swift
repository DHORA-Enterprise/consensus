struct Block {
    var data: String
    var previousHash: String
    var miner: String
    var burnFee: Double
    var hash: String

    init(data: String, previousHash: String, miner: String, burnFee: Double) {
        self.data = data
        self.previousHash = previousHash
        self.miner = miner
        self.burnFee = burnFee
        self.hash = calculateHash()
    }

    func calculateHash() -> String {
        let dataString = data + previousHash + miner + String(burnFee)
        let dataData = dataString.data(using: .utf8)!
        let hash = SHA256.hash(data: dataData)
        return hash.map { String(format: "%02x", $0) }.joined()
    }
}

class Blockchain {
    var chain: [Block]
    var blockTime: Double
    var burnFees: [String: Double]

    init() {
        chain = [createGenesisBlock()]
        blockTime = 5000
        burnFees = [:]
    }

    func createGenesisBlock() -> Block {
        return Block(data: "Genesis Block", previousHash: "0", miner: "", burnFee: 0)
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

    func addBurnFee(miner: String, burnFee: Double) {
        burnFees[miner] = burnFee
    }

    func selectMiner() -> String {
        let highestBurnFee = burnFees.values.max()
        return burnFees.first(where: { $0.value == highestBurnFee })!.key
    }

    func mineBlock(block: Block) -> Bool {
        return block.miner == selectMiner()
    }
}
