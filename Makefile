.PHONY: install analysis test docs

install:
	make -C j_proj install

analysis:
	mvn -C j_proj checkstyle:check

test:
	mvn -C j_proj test

docs:
	mvn -C j_proj javadoc:javadoc
