struct Block {
    var data: String
    var previousHash: String
    var nonce: Int
    var hash: String

    init(data: String, previousHash: String) {
        self.data = data
        self.previousHash = previousHash
        nonce = 0
        hash = calculateHash()
    }

    func calculateHash() -> String {
        let dataString = data + previousHash + String(nonce)
        let dataData = dataString.data(using: .utf8)!
        let hash = SHA256.hash(data: dataData)
        return hash.map { String(format: "%02x", $0) }.joined()
    }
}

class Blockchain {
    var chain: [Block]
    var difficulty: Int

    init() {
        chain = [createGenesisBlock()]
        difficulty = 2
    }

    func createGenesisBlock() -> Block {
        return Block(data: "Genesis Block", previousHash: "0")
    }

    func getLatestBlock() -> Block {
        return chain[chain.count - 1]
    }

    func addBlock(newBlock: Block) {
        newBlock.previousHash = getLatestBlock().hash
        newBlock.mineBlock(difficulty: difficulty)
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
}

extension Block {
    mutating func mineBlock(difficulty: Int) {
        let target = String(repeating: "0", count: difficulty)
        while hash.prefix(difficulty) != target {
            nonce += 1
            hash = calculateHash()
        }
    }
}
