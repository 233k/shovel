APP = shovel

REBAR = rebar3

default: shell

compile:
	$(REBAR) compile

clean:
	$(REBAR) clean

deps:
	$(REBAR) deps

dialyzer:
	$(REBAR) dialyzer

edoc:
	$(REBAR) edoc

escriptize:
	$(REBAR) escriptize

eunit:
	$(REBAR) eunit

shell:
	$(REBAR) shell

cluster:
	$(REBAR) shell --sname $(APP)_$$(openssl rand -hex 2)
