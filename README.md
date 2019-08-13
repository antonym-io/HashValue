# HashValue
Solidity code for posting a Hash value to blockchain


This contract has been deployed to Ethereum mainnet at address: TBD

Etherscan link:  TBD


Tools:

Ganache
https://www.trufflesuite.com/ganache

Truffle
https://www.trufflesuite.com/


Install Ganache first, then install Truffle.  Link Truffle instance to Ganache ([Contracts] tab on the Ganache console).  This gives visibilty into Smart Contract deployments via the Ganache console.



Smart Contracts live in the "contracts" directory.


For Truffle usage, add any created Smart Contracts to the "migrations/2_deploy_contracts.js" file.

# Working with Truffle

Truffle console can be started with the following command:

	truffle console

With the existing Truffle configurations (in truffle-config.js), Truffle will initially load with the 'development' configuration, which points it at the locally operating Ganache instance.  You can start Truffle console running against the configured (again truffle-config.js) Kaleido instance by starting Truffle console with:

	truffle console --network kaleido



# Compiling Smart Contracts

From a truffle console window in the project directory, with Truffle (and Ganache) installed, execute:

	compile

To deploy the Smart Contracts, execute:

	migrate

Upon deployment, you should see the Smart Contract deployment in a series of transactions in the Ganache console.


To execute the unit tests, execute:

	test

Tests exist in the "test" directory.  Both solidity and Javascript tests are supported, but Javascript tests seem to be more mature currently.  All files in the "test" directory will be compiled and treated as a test file.



# Working with Truffle and public networks

To avoid having to put any private information in the truffle config file (truffle-config.js), you must set some environment variables to contain sensitive information.  There are two pieces of information that must be set in the environment for Truffle to work at this point.  

To set an environment variable, do a
	export {variable_name}="{variable_value}"

Variables that must be set at this time with this truffle-config.js file are:
	ETH_WALLET_MNEMONIC - The 12-word mnemonic to be used for the account to be used to interact with the network.  NOTE: this encodes the PRIVATE KEY of this account, and should be kept private; anyone with this mnemonic has the PRIVATE KEY for this account, and can do anything they want with this account. 
	ETH_NETWORK - The URI of the network endpoint to be used to interact with the specified network.  In the case of using Ropsten via Infura, that will look like:  "https://ropsten.infura.io/v3/[network_id]"

