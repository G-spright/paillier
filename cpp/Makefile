CXX = g++
CXXFLAGS = -g -Wall -std=c++11 -I$(INCDIR)
LDFLAGS = -L. -lm -lgmp -lmpfr -lgmpxx -lgmpfrxx

SRCDIR = src
INCDIR = inc
SRCS = $(wildcard $(SRCDIR)/*.cpp)
OBJS = $(patsubst $(SRCDIR)/%.cpp, %.o, $(SRCS))

EXEC = test

all: $(EXEC)

$(EXEC): $(OBJS)
	$(CXX) $(CXXFLAGS) $^ -o $@ $(LDFLAGS)

%.o: $(SRCDIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f $(EXEC) $(OBJS)
