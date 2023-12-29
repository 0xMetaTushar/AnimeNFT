// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.2 <0.9.0;
// Uncomment this line to use console.log
// import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract AnimeNFT is ERC721, ERC721URIStorage {
    uint256 public _nextTokenId;

    constructor()
        ERC721("Anime", "ANFT")
    {} 

    function _baseURI() internal pure override returns (string memory) {
        return "https://crimson-magic-clam-74.mypinata.cloud/ipfs/";
    }

    function safeMint(address to, string memory uri) public{
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    // The following functions are overrides required by Solidity.

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
