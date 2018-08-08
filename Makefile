all: 
	ponyc ./src --output build --bin-name powny

run:
	@./build/powny

tests:
	ponyc ./src/tests --output build --bin-name tests

run-tests:
	@./build/tests

clear:
	@rm -rf build