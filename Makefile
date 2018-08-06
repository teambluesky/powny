all: 
	ponyc ./src --output build --bin-name powny

run:
	@./build/powny