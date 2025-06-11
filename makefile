
CXX = g++
CXXFLAGS += -I temper.out/cpp
CXXFLAGS += -fmax-errors=5
CXXFLAGS += -std=c++11

build: .dummy
	${CXX} -c driver/comp.cpp ${CXXFLAGS}

.dummy:
