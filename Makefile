release: clean
	rebar3 tar
compile:
	rebar3 compile
test: clean
	rebar3 do clean, upgrade, eunit, ct, cover
analyze: clean
	rebar3 dialyzer
doc: clean
	rebar3 edoc
clean:
	rm -fr ./_build ./c_src/*.o ./priv ./doc
