from moccasin.boa_tools import VyperContract
from src import favorites, favorites_factory, five_more


def deploy_favorites() -> VyperContract:
    favorites_contract: VyperContract = favorites.deploy()
    return favorites_contract


def deploy_factory(favorites_contract: VyperContract):
    factory_contract = favorites_factory.deploy(favorites_contract)
    factory_contract.create_favorites_contract()

    new_favorites_address: str = factory_contract.list_of_favorite_contracts(0)
    new_favorites_contract: VyperContract = favorites.at(new_favorites_address)
    new_favorites_contract.store(77)
    print(f"Store value: {new_favorites_contract.retrieve()}")

    factory_contract.store_from_factory(0, 88)
    print(f"New contract stored value: {new_favorites_contract.retrieve()}")
    print(f"Original contract stored value: {favorites_contract.retrieve()}")


def deploy_five_more():
    five_more_contract: VyperContract = five_more.deploy()
    print(f"Five more: {five_more_contract.retrieve()}")
    five_more_contract.store(95)
    print(f"Five more stored: {five_more_contract.retrieve()}")

    # @dev Worshop first module
    print(five_more_contract.get_my_message())
    five_more_contract.set_my_message(
        f"I am the new one with number: {five_more_contract.retrieve()}"
    )
    print(five_more_contract.get_my_message())

    # @dev Worshop second module
    print(f"It should not be true: {five_more_contract.get_is_true()}")
    five_more_contract.set_is_true()
    print(f"It should be true now: {five_more_contract.get_is_true()}")

    # @dev Worshop third module with uses
    print(five_more_contract.get_end_message())


def moccasin_main():
    favorites_contract = deploy_favorites()
    deploy_factory(favorites_contract)
    deploy_five_more()
