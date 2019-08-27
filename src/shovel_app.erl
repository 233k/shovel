%%%-------------------------------------------------------------------
%% @doc shovel public API
%% @end
%%%-------------------------------------------------------------------

-module(shovel_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    shovel_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
