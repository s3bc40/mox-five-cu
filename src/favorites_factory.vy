# pragma version 0.4.0
# @licence MIT

from interfaces import i_favorites

list_of_favorite_contracts: public(DynArray[i_favorites, 100])
original_favorite_contract: address

@deploy
def __init__(original_favorite_contract: address):
    self.original_favorite_contract = original_favorite_contract

@external
def create_favorites_contract():
    new_favorite_contract: address = create_copy_of(self.original_favorite_contract)
    self.list_of_favorite_contracts.append(i_favorites(new_favorite_contract))
    

@external
def store_from_factory(favorites_index: uint256, new_number: uint256):
    favorites_contract: i_favorites = self.list_of_favorite_contracts[favorites_index]
    extcall favorites_contract.store(new_number)
    

@view
@external
def view_from_factory(favorites_index: uint256) -> uint256:
    return staticcall self.list_of_favorite_contracts[favorites_index].retrieve()
    
