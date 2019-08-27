-module(shovel_sup).

-behaviour(supervisor).

-export([start_link/0]).

-export([init/1]).

-define(SRV_SUP_SPEC, #{
    id => shovel_srv,
    start => {shovel_srv_sup, start_link, []},
    type => supervisor
}).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% sup_flags() = #{
%%     strategy => strategy(),         % optional
%%     intensity => non_neg_integer(), % optional
%%     period => pos_integer()         % optional
%% }
%% child_spec() = #{
%%     id => child_id(),               % mandatory
%%     start => mfargs(),              % mandatory
%%     restart => restart(),           % optional
%%     shutdown => shutdown(),         % optional
%%     type => worker(),               % optional
%%     modules => modules()            % optional
%% }

init([]) ->
    SupFlags = #{
        strategy => one_for_all,
        intensity => 0,
        period => 1
    },
    ChildSpecs = [?SRV_SUP_SPEC],
    {ok, {SupFlags, ChildSpecs}}.
