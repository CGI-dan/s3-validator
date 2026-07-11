SHELL := /bin/bash

CXX ?= g++
CXXFLAGS ?= -std=c++17 -O3 -DNDEBUG -flto
LDFLAGS ?= -flto

TARGET := crc64nvme_s3
SRC := crc64nvme_s3.cpp
OBJ := $(SRC:.cpp=.o)
NPROC := $(shell command -v nproc >/dev/null 2>&1 && nproc || getconf _NPROCESSORS_ONLN 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 1)

.PHONY: all build build-fast test clean

all: build

build:
	@$(MAKE) --no-print-directory -j$(NPROC) $(TARGET)

build-fast: build

$(TARGET): $(OBJ)
	$(CXX) $(OBJ) $(LDFLAGS) -o $@

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

test: build
	./$(TARGET) --self-test

clean:
	rm -f $(TARGET) $(OBJ)
