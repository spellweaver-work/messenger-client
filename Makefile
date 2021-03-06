default: build
all: build

ICED=node_modules/.bin/iced
BUILD_STAMP=build-stamp
TEST_STAMP=test-stamp

default: build
all: build

lib/%.js: src/%.iced
	$(ICED) -I node -c -o `dirname $@` $<

$(BUILD_STAMP): \
	lib/authenticate.js \
	lib/base.js \
	lib/thread.js \
	lib/config.js \
	lib/data.js \
	lib/err.js \
	lib/main.js \
	lib/post.js \
	lib/stubs.js \
	lib/session.js
	date > $@

clean:
	find lib -type f -name *.js -exec rm {} \;

build: $(BUILD_STAMP) 

setup: 
	npm install -d

test:
	(cd test && ../$(ICED) run.iced)

.PHONY: test setup
