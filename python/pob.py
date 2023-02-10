import hashlib
import time

class Transaction:
    def __init__(self, sender, receiver, amount, burned_coins):
        self.sender = sender
        self.receiver = receiver
        self.amount = amount
        self.burned_coins = burned_coins

class Block:
    def __init__(self, index, timestamp, transactions, prev_hash):
        self.index = index
        self.timestamp = timestamp
        self.transactions = transactions
        self.prev_hash = prev_hash
        self.hash = self.calculate_hash()

    def calculate_hash(self):
        block_data = str(self.index) + str(self.timestamp) + str(self.prev_hash)
        for tx in self.transactions:
            block_data += tx.sender + tx.receiver + str(tx.amount) + str(tx.burned_coins)
        return hashlib.sha256(block_data.encode()).hexdigest()

class Blockchain:
    def __init__(self):
        self.chain = [self.create_genesis_block()]

    def create_genesis_block(self):
        genesis_transaction = Transaction("", "", 0, 0)
        return Block(0, time.time(), [genesis_transaction], "0")

    def add_block(self, transactions):
        prev_block = self.chain[-1]
        new_block = Block(len(self.chain), time.time(), transactions, prev_block.hash)
        new_block.hash = new_block.calculate_hash()
        self.chain.append(new_block)

    def is_block_valid(self, new_block, prev_block):
        if prev_block.index + 1 != new_block.index:
            return False
        if prev_block.hash != new_block.prev_hash:
            return False
        if new_block.calculate_hash() != new_block.hash:
            return False
        for tx in new_block.transactions:
            if tx.burned_coins <= 0:
                return False
        return True

    def proof_of_burn(self):
        # Proof of Burn validation logic
        pass
