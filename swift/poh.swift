struct Block {
    var data: String
    var previousHash: String
    var miner: String
    var proofOfHistory: String
    var hash: String

    init(data: String, previousHash: String, miner: String, proofOfHistory: String) {
        self.data = data
        self.previousHash = previousHash
        self.miner = miner
        self.proofOfHistory = proofOfHistory
        self.hash = calculateHash()
    }

    func calculateHash() -> String {
        let dataString = data + previousHash + miner + proofOfHistory
        let dataData = dataString.data(using: .utf8)!
        let hash = SHA256.hash(data: dataData)
        return hash.map { String(format: "%02x", $0) }.joined()
    }
}

class Blockchain {
    var chain: [Block]
    var blockTime: Double
    var proofsOfHistory: [String: String]

    init() {
        chain = [createGenesisBlock()]
        blockTime = 5000
        proofsOfHistory = [:]
    }

    func createGenesisBlock() -> Block {
        return Block(data: "Genesis Block", previousHash: "0", miner: "", proofOfHistory: "")
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

    func addProofOfHistory(miner: String, proofOfHistory: String) {
        proofsOfHistory[miner] = proofOfHistory
    }

    func mineBlock(block: Block) -> Bool {
        let minerProofOfHistory = proofsOfHistory[block.miner]
        return minerProofOfHistory == block.proofOfHistory
    }
}
