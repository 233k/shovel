-module(shovel_srv_sup).

-behaviour(supervisor).

-export([start_link/0, start_child/0]).

-export([init/1]).

-define(SRV_SPEC, #{
    id => shovel_srv,
    start => {shovel_srv, start_link, []}
}).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init(_Args) ->
   SupFlags = #{
        strategy => simple_one_for_one,
        intensity => 0,
        period => 1
    },
    ChildSpecs = [?SRV_SPEC],
    {ok, {SupFlags, ChildSpecs}}.

start_child() ->
    supervisor:start_child(?MODULE, []).
