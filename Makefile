SRC=test-main.cpp ./xxhash.c
BIN=cdc
BIN_AVX=cdc-avx
Debug_Bin=cdc.debug
FLAGS= -fno-stack-protector
LINKS= -lbsd -lpthread -lm -lssl -lcrypto -lstdc++

all:
	gcc $(FLAGS) -ggdb -O3 -o $(BIN) $(SRC) $(LINKS)
	gcc $(FLAGS) -ggdb -o $(Debug_Bin) $(SRC) $(LINKS)
	#gcc $(FLAGS) -O3 -march=native -o $(BIN_AVX) $(SRC) $(LINKS)
clean:
	rm -f $(BIN) $(Debug_Bin) $(BIN_AVX)
