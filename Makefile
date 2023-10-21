include .env
export 

run:
	 anvil

.PHONY: tests 
tests:
		forge test -vv

.PHONY: deploy
deploy:
		forge script ${dir}

.PHONY: test

test:
		forge test --match-contract ${c} --match-test ${t} -vvv


.PHONY: tests-sepolia
tests-sepolia:
	forge test --fork-url $$SEPOLIA_RPC_URL

.PHONY: test-sepolia

test-sepolia:
	forge test --match-test ${t} -vv --fork-url $$SEPOLIA_RPC_URL 
	 

.PHONY: test-coverage
test-coverage:
	forge coverage --fork-url $$SEPOLIA_RPC_URL