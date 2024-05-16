#!/usr/bin/env bash

cargo build --release

case $OSTYPE in
"linux-gnu"*)
	mv ./target/release/liblua_json5.so lua/json5.so
	strip lua/json5.so
	cargo clean
	;;
"darwin"*)
	# Provide both just in case
	cp ./target/release/liblua_json5.dylib lua/json5.dylib
	cp lua/json5.dylib lua/json5.so
	cargo clean
	;;
esac
