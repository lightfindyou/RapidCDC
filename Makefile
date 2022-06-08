SRC=test-main.cpp ./xxhash.c
BIN=cdc
BIN_AVX=cdc-avx
Debug_Bin=cdc.debug
FLAGS= -fno-stack-protector -lbsd -lpthread -lm

all:
	gcc $(FLAGS) -ggdb -O3 -o $(BIN) $(SRC) -lssl -lcrypto $(FLAGS)
	gcc $(FLAGS) -ggdb -o $(Debug_Bin) $(SRC) -lssl -lcrypto $(FLAGS)
	#gcc $(FLAGS) -O3 -march=native -o $(BIN_AVX) $(SRC) -lssl -lcrypto $(FLAGS)
clean:
	rm -f $(BIN) $(Debug_Bin) $(BIN_AVX)
