%%%
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
%%% File:      folsom_webmachine_metrics_list_handler.erl
%%% @author    joe williams <j@boundary.com>
%%% @doc
%%% http metrics list end point
%%% @end
%%%------------------------------------------------------------------


-module(folsom_cowboy_metrics_list_handler).
-export([init/2]).

init(Req, Opts) ->
    Info = cowboy_req:qs_val(<<"info">>, Req, undefined),
    Req2 = get_request(Info),
    {ok, Req2, Opts}.

get_request({<<"true">>, Req}) ->
    Metrics = [{M, proplists:delete(tags, List)} ||
               {M, List} <- folsom_metrics:get_metrics_info()],

    cowboy_req:reply(200, [], mochijson2:encode(Metrics), Req);
get_request({_, Req}) ->
    cowboy_req:reply(200, [], mochijson2:encode(folsom_metrics:get_metrics()), Req).
