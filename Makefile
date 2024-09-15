MIX = mix
CFLAGS = -g -std=gnu99 -O3 -pedantic -Wall -Wextra -Wno-unused-parameter

ERLANG_PATH = $(shell erl -eval 'io:format("~s", [lists:concat([code:root_dir(), "/erts-", erlang:system_info(version), "/include"])])' -s init stop -noshell)
CFLAGS += -I$(ERLANG_PATH)

CFLAGS += -I$(HOEDOWN_PATH)/c_src

ifneq ($(OS),Windows_NT)
	CFLAGS += -fPIC

	ifeq ($(shell uname),Darwin)
		LDFLAGS += -dynamiclib -undefined dynamic_lookup
	endif
endif

.PHONY: all monotonic clean

all: monotonic

monotonic: priv priv/monotonic_nif.so

priv:
	mkdir priv

priv/monotonic_nif.so: c_src/monotonic_nif.c
	$(CC) $(CFLAGS) -shared $(LDFLAGS) -o $@ c_src/monotonic_nif.c

clean:
	$(RM) priv/monotonic_nif.so
