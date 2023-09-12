DESTDIR = /usr
PREFIX = /local
LDCONFIG = sudo ldconfig

CXX = g++
CXXSTANDARD = -std=c++14
OPTFLAGS = -O3 -flto
MFLAGS = -mcpu=native
PFLAGS = -pthread
WFLAGS = -D_FORTIFY_SOURCE=2 -Wall -Wextra -Wpedantic -Wconversion -Wsign-conversion -Wformat-security -Winline -Wformat=2 -Wattributes \
-Wbuiltin-macro-redefined -Wcast-align -Wdiv-by-zero -Wdouble-promotion -Wfloat-equal -Wint-to-pointer-cast -Wlogical-op -Woverflow \
-Wpointer-arith -Wredundant-decls -Wshadow -Wsign-promo -Wwrite-strings -Wimplicit-fallthrough=5 -Wstringop-overflow=4 -Wstrict-aliasing=3
EXTRA_CXXFLAGS = -pipe -fPIC

INCLUDE	= -I.
CXXFLAGS = $(CXXSTANDARD) $(OPTFLAGS) $(MFLAGS) $(PFLAGS) $(WFLAGS) $(EXTRA_CXXFLAGS) $(INCLUDE)

LIBS = -lm -lpthread -lrt -lcrypt -lwiringPi -lwiringPiDev

###############################################################################

SRC	= barometerTest.C

default:
	$(CXX) $(CXXFLAGS) $(SRC) -o barometerTest

clean:
	@ rm barometerTest