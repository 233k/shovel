APP = shovel

REBAR = ./rebar3

default: start

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

start:
	$(REBAR) shell --sname $(APP)
