.PHONY: all clean

TABLES  := issues events
SCHEMAS := $(TABLES:%=%.sql)

all: structure.sql

structure.sql: $(SCHEMAS)
	cat $^ > $@

%.sql: %.json generate-ddl
	./generate-ddl $< > $@

clean:
	rm -f *.sql
