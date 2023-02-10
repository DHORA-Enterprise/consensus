# Consensus

The main consensus of blockchain technologies

Blockchain consensus refers to the process by which a blockchain network agrees on the current state of the blockchain and the order of transactions. The consensus mechanism is the foundation of a blockchain's security and reliability, ensuring that all nodes in the network have a shared understanding of the blockchain's state and preventing malicious actors from altering the blockchain's history.

There are several consensus mechanisms used in different blockchain networks, including Proof of Work (PoW), Proof of Stake (PoS), Delegated Proof of Stake (DPoS), Proof of Burn (PoB), and Proof of History (PoH). Each mechanism operates differently and has its own set of benefits and limitations.

In a Proof of Work consensus mechanism, validators compete to solve a cryptographic puzzle and the first validator to solve the puzzle gets to add the next block to the chain.

In a Proof of Stake consensus mechanism, validators are selected based on the amount of cryptocurrency they have "staked" and are willing to risk. The selected validator must then solve a cryptographic puzzle to validate transactions and add blocks to the chain.

In a Delegated Proof of Stake mechanism, stakeholders vote for a limited number of validators who are then responsible for validating transactions and adding blocks to the chain.

In a Proof of Burn consensus mechanism, validators must burn or destroy a certain amount of cryptocurrency to participate in the validation process and add blocks to the chain.

In a Proof of History consensus mechanism, a pre-computed and publicly available hash function is used to reduce a large amount of data into a small, fixed-size output. The output, known as a proof of history, is then used to determine the ordering of transactions and blocks in the blockchain.

Regardless of the specific consensus mechanism used, the goal of consensus is to ensure that all nodes in the network have a shared understanding of the blockchain's state and to prevent malicious actors from altering the blockchain's history.

## Delegated Proof of Stake

Delegated Proof of Stake (DPoS) is a consensus mechanism used by some blockchain networks as an alternative to Proof of Work (PoW) or Proof of Stake (PoS) algorithms.

In a DPoS system, token holders can delegate their voting power to "delegates," also known as "witnesses," who are responsible for verifying transactions and adding new blocks to the chain. The delegates are elected by the token holders, who have a certain number of votes proportional to the number of tokens they hold. The top N delegates with the most votes are chosen to be the "validators" for the network.

When a new block is added to the chain, the validators take turns proposing and verifying the transactions in the block, and the other validators must reach consensus on the validity of the transactions. If a validator is found to be malicious or non-responsive, they can be voted out by the token holders and replaced by a different delegate.

The main benefit of DPoS over PoW or PoS is that it is more energy efficient and has a faster transaction processing time, as there are fewer nodes involved in the consensus process. However, it is also considered to be less secure and more susceptible to centralization, as the delegates have a large amount of influence over the network and can collude to manipulate the system.

## Leased Proof of Stake

Leased Proof of Stake (LPoS) is a consensus mechanism used by some blockchain networks.

In an LPoS system, token holders can "lease" their stake to a validating node, allowing the node to use the token holder's stake to validate transactions and add blocks to the chain. The validating node earns rewards for their work, which they share with the token holder. The token holder retains control over their tokens and can stop the lease at any time.

When a new block is added to the chain, the validating nodes compete to be the first to solve a cryptographic puzzle and validate the block's transactions. The node that solves the puzzle first earns a reward and gets to add the block to the chain.

The main benefit of LPoS over other consensus mechanisms, such as Proof of Work (PoW) or Proof of Stake (PoS), is that it allows token holders to participate in the consensus process without having to run a full node themselves. This can lead to a more decentralized and secure network, as there are more nodes involved in the validation process. However, it also has the potential for centralization, as token holders may choose to lease their tokens to a small number of trusted validating nodes.

## Proof of Stake

Proof of Stake (PoS) is a consensus mechanism used by some blockchain networks as an alternative to Proof of Work (PoW) algorithms.

In a PoS system, validating nodes are selected randomly to validate transactions and add blocks to the chain based on the amount of stake they hold. The more stake a node holds, the greater its chances of being selected as a validator.

When a new block is added to the chain, the selected validator must solve a cryptographic puzzle to prove that they have control over their stake and are committed to validating the block's transactions. If the validator produces a valid solution, they earn a reward and the block is added to the chain. If the validator produces an invalid solution, their stake is punished, and they are less likely to be selected as a validator in the future.

The main benefit of PoS over PoW is that it is more energy efficient and has a faster transaction processing time, as validators are selected based on their stake rather than computing power. Additionally, PoS systems are less susceptible to centralization, as the validation process does not require significant computing resources and can be performed on a regular computer. However, PoS systems can still be susceptible to centralization if a small number of nodes hold a large amount of stake.

## Proof of Burn

Proof of Burn (PoB) is a consensus mechanism used by some blockchain networks as an alternative to Proof of Work (PoW) and Proof of Stake (PoS) algorithms.

In a PoB system, a user sends some of their cryptocurrency to a "burn address" - a public address with an unspendable balance. The act of sending the coins to the burn address demonstrates that the user has control over them and is committed to the network.

Over time, the network keeps track of the amount of cryptocurrency that has been burned. When a user wants to become a validating node, they must burn a certain amount of cryptocurrency proportional to the network's total burn rate. The more cryptocurrency a user burns, the greater their chances of being selected as a validator.

When a new block is added to the chain, the selected validator must solve a cryptographic puzzle to prove that they have control over their stake and are committed to validating the block's transactions. If the validator produces a valid solution, they earn a reward and the block is added to the chain. If the validator produces an invalid solution, their stake is punished, and they are less likely to be selected as a validator in the future.

The main benefit of PoB over PoW and PoS is that it provides a way to demonstrate commitment to the network without requiring significant computational resources. Additionally, PoB systems are less susceptible to centralization as the validation process does not require a large amount of computing power or a large stake in the network's cryptocurrency. However, PoB systems may still be susceptible to centralization if a small number of users hold a large amount of cryptocurrency.

## Proof of History

Proof of History (PoH) is a consensus mechanism used by some blockchain networks as a way to reduce the amount of computing power required to validate transactions and add blocks to the chain.

In a PoH system, a pre-computed and publicly available hash function is used to compress a large amount of data into a small, fixed-size output. This output, known as a proof of history, is then used to determine the ordering of transactions and blocks in the blockchain.

Each validator node generates a proof of history and broadcast it to the network. The network then uses the proof of history as a starting point to build the next block, with each subsequent block referencing the previous block's proof of history.

When a new block is added to the chain, the selected validator must solve a cryptographic puzzle to prove that they have control over their stake and are committed to validating the block's transactions. If the validator produces a valid solution, they earn a reward and the block is added to the chain. If the validator produces an invalid solution, their stake is punished, and they are less likely to be selected as a validator in the future.

The main benefit of PoH over traditional consensus mechanisms is that it reduces the amount of computing power required to validate transactions and add blocks to the chain, making it more energy-efficient. Additionally, PoH systems are less susceptible to centralization as the validation process does not require a large amount of computing power or a large stake in the network's cryptocurrency. However, PoH systems may still be susceptible to centralization if a small number of nodes control the proof of history generation process.

## Proof of Work

Proof of Work (PoW) is a consensus mechanism used by some blockchain networks to validate transactions and add blocks to the chain.

In a PoW system, validator nodes compete to solve a cryptographic puzzle that requires significant computational effort. The first validator to solve the puzzle gets to add the next block to the chain and receive a reward for their effort.

When a new block is added to the chain, it is broadcast to the network, and the other validators must perform a computationally intensive process to validate the new block and the transactions it contains. This validation process helps to secure the network and prevent malicious actors from adding false or malicious blocks to the chain.

The cryptographic puzzle that validators must solve is designed to be difficult but solvable. It must be difficult enough that it takes a significant amount of time and computational power to solve, but not so difficult that no validator can ever solve it. This balance ensures that the network remains secure and that new blocks are added to the chain in a regular and predictable manner.

The main benefit of PoW is that it provides a way to secure the network and prevent malicious actors from adding false or malicious blocks to the chain. However, PoW is also a significant energy drain as it requires large amounts of computing power to validate transactions and add blocks to the chain. This energy consumption has led to criticism of PoW and the development of alternative consensus mechanisms, such as Proof of Stake (PoS) and Proof of History (PoH).

## Proof of Replication

