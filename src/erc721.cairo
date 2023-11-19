#[starknet::contract]
mod Demo_ERC721 { 
    //Here we are going to first take a constructor function and that takes the name and symbol as input and then intializes the contract with those inputs
    #[storage]
    struct Storage {
    name: felt252,
    symbol: felt252,
    owners: LegacyMap::<u256, ContractAddress>,
    balances: LegacyMap::<ContractAddress, u256>,
    token_approvals: LegacyMap::<u256, ContractAddress>,
    // (owner, operator)
    operator_approvals: LegacyMap::<(ContractAddress, ContractAddress), bool>,
}

    #[constructor]
    fn constructor(_name: felt252,_symbol: felt252){
        //First we are setting the name and symbol
        name::write(_name);
        symbol::write(_symbol);
    }

    //We are getting this from the IERC721 interface
    #[view]
    fn get_name() -> felt252 {
        name::read()
    }

    #[view]
    fn get_symbol() -> felt252 {
        symbol::read()
    }
}
