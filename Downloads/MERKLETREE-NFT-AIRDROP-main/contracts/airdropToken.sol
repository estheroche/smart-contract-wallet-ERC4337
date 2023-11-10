// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// MY FLOW

// Prepare an ERC20 token as an airdrop token. You can use an existing token or deploy a new ERC20 token on the DApp’s page.
// Prepare the whitelist and their drop amount, generate the Merkle tree, and output to the JSON file. Check the JSON file format below. It contains the Merkle root, the total token amount for airdrop, individual token amounts, and a list of Merkle proofs.
// Deploy MerkleTreeAirdrop contract with Merkle root.
// Transfer drop assets to this contract.
// Beneficiaries can claim their drop tokens by claim function.
// Only verified users can claim.

library MerkleProofLib {
    function verify(
        bytes32[] calldata proof,
        bytes32 root,
        bytes32 leaf
    ) internal pure returns (bool isValid) {
        /// @solidity memory-safe-assembly
        assembly {
            if proof.length {
                // Left shifting by 5 is like multiplying by 32.
                let end := add(proof.offset, shl(5, proof.length))

                // Initialize offset to the offset of the proof in calldata.
                let offset := proof.offset

                // Iterate over proof elements to compute root hash.
                // prettier-ignore
                for {} 1 {} {
                    // Slot where the leaf should be put in scratch space. If
                    // leaf > calldataload(offset): slot 32, otherwise: slot 0.
                    let leafSlot := shl(5, gt(leaf, calldataload(offset)))

                    // Store elements to hash contiguously in scratch space.
                    // The xor puts calldataload(offset) in whichever slot leaf
                    // is not occupying, so 0 if leafSlot is 32, and 32 otherwise.
                    mstore(leafSlot, leaf)
                    mstore(xor(leafSlot, 32), calldataload(offset))

                    // Reuse leaf to store the hash to reduce stack operations.
                    leaf := keccak256(0, 64) // Hash both slots of scratch space.

                    offset := add(offset, 32) // Shift 1 word per cycle.

                    // prettier-ignore
                    if iszero(lt(offset, end)) { break }
                }
            }

            isValid := eq(leaf, root) // The proof is valid if the roots match.
        }
    }
}

pragma solidity ^0.8.17;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract airdropToken is ERC20 {
    event poolId(uint32 _voteId, string message);
    address admin;
    bytes32 merkleRoot;
    mapping(address => bool) claimedAirdrop;
    uint256 airDropAmount = 1000;

    constructor(
        uint256 amount,
        string memory _name,
        string memory _symbol,
        bytes32 _merkleRoot
    ) ERC20(_name, _symbol) {
        merkleRoot = _merkleRoot;
        admin = msg.sender;
        _mint(address(this), amount * (10 ** decimals()));
    }

    /////////////// /////////////////////////////////////////////

    function claimAirdrop(
        bytes32[] calldata proof,
        bytes32 root,
        bytes32 leaf
    ) public {
        require(checkRoot(), "NOT ELIGIBLE YET");
        require(!(claimedAirdrop[msg.sender]), "YOU HAVE AREADY BEEN AIRDROP");
        // bool status = verify(proof, root, leaf);
        require(
            verify(proof, root, leaf),
            "SORRY, NOT DRAFTED FOR THIS AIRDROP"
        );
        claimedAirdrop[msg.sender] = true;
        _mint(msg.sender, airDropAmount * (10 ** decimals()));
    }

    function setMerkleRoot(bytes32 _merkleRoot) public {
        require(msg.sender == admin, "ONLY ADMIN");
        merkleRoot = _merkleRoot;
    }

    function checkRoot() internal view returns (bool status) {
        (merkleRoot.length > 0) ? status = true : status = false;
    }

    function verify(
        bytes32[] calldata proof,
        bytes32 root,
        bytes32 leaf
    ) public pure returns (bool) {
        bool status = MerkleProofLib.verify(proof, root, leaf);
        return status;
    }
}
