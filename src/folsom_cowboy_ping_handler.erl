%%
%%% Copyright 2011, Boundary
%%%
%%% Licensed under the Apache License, Version 2.0 (the "License");
%%% you may not use this file except in compliance with the License.
%%% You may obtain a copy of the License at
%%%
%%%     http://www.apache.org/licenses/LICENSE-2.0
%%%
%%% Unless required by applicable law or agreed to in writing, software
%%% distributed under the License is distributed on an "AS IS" BASIS,
%%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%%% See the License for the specific language governing permissions and
%%% limitations under the License.
%%%


%%%-------------------------------------------------------------------
%%% File:      folsom_webmachine_ping_handler.erl
%%% @author    joe williams <j@boundary.com>
%%% @doc
%%% http ping end point
%%% @end
%%%------------------------------------------------------------------

-module(folsom_cowboy_ping_handler).
-export([init/2]).

init(Req, Opts) ->
    Req2 = cowboy_req:reply(200, [], mochijson2:encode([{<<"pong">>, ok}]), Req),
    {ok, Req2, Opts}.
