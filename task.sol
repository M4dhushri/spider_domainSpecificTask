// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PaperStorage {
    struct Paper {
        string title;
        string author;
        string ipfsHash;
        address uploader;
        uint256 timestamp;
    }

    Paper[] public papers;

    event PaperUploaded(string title, string author, string ipfsHash, address uploader, uint256 timestamp);

    function uploadPaper(string memory _title, string memory _author, string memory _ipfsHash) public {
        Paper memory newPaper = Paper(_title, _author, _ipfsHash, msg.sender, block.timestamp);
        papers.push(newPaper);
        emit PaperUploaded(_title, _author, _ipfsHash, msg.sender, block.timestamp);
    }

    function getAllPapers() public view returns (Paper[] memory) {
        return papers;
    }
}