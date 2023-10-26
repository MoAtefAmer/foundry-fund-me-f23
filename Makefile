include .env
export 

run:;anvil

# .PHONY: tests 
tests:;forge test -vv


# Show storage of contract
cast-storage:;cast storage ${c}

# Deploy on chain
deploy-rpc:;forge script ${dir} --rpc-url ${ch}	--private-key ${pk} --broadcast 
# --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvv

deploy:;forge script ${dir}


test:;forge test  --match-test ${t} -vvv



tests-sepolia:;	forge test --fork-url $$SEPOLIA_RPC_URL



test-sepolia:;forge test --match-test ${t} -vv --fork-url $$SEPOLIA_RPC_URL 
	 


coverage:;forge coverage --fork-url $$SEPOLIA_RPC_URL

snapshot:;forge snapshot # gas snapshot; how much gas will this test cost 


storage-layout:;forge inspect ${c} storageLayout


foundry-devops:;forge install ChainAccelOrg/foundry-devops --no-commit
