%%% -*- Mode: Erlang; fill-column: 75; comment-column: 50; -*-
%%% -------------------------------------------------------------------
%%%
%%% Copyright (c) 2016 jrobhoward (jrobhoward@gmail.com)
%%%
%%% This file is provided to you under the Apache License,
%%% Version 2.0 (the "License"); you may not use this file
%%% except in compliance with the License.  You may obtain
%%% a copy of the License at
%%%
%%%   http://www.apache.org/licenses/LICENSE-2.0
%%%
%%% Unless required by applicable law or agreed to in writing,
%%% software distributed under the License is distributed on an
%%% "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
%%% KIND, either express or implied.  See the License for the
%%% specific language governing permissions and limitations
%%% under the License.
%%%
%%% -------------------------------------------------------------------
%%%
-module(git_web_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

%% @doc Callback to application start event.  Start and link the supervisor.
%% @private
-spec start(_, _) -> {ok, pid()} | {error, any()}.
start(_StartType, _StartArgs) ->
    case git_web_sup:start_link() of
        {ok, Pid} ->

	    PrivDir = code:priv_dir(git_web),
	    TraceDir = PrivDir ++ "/traces",
	    ok = filelib:ensure_dir(TraceDir ++ "/arbitrary_filename.txt"),

	    %% The original rest endpoints were added in git_web_config.erl
	    %% It is likely that other apps would depend on git_web, and add their
	    %% endpoints programmatically.. This is how:
	    DynamicTraceAddition = {["dev", "wmtrace", '*'], wmtrace_resource,
				    [{trace_dir, TraceDir}]},
	    webmachine_router:add_route(DynamicTraceAddition),

	    DynamicSecureAddition = {["secure", "helloworld", '*'], git_web_secure_resource,
				     []},
	    webmachine_router:add_route(DynamicSecureAddition),

	    {ok, Pid};
        {error, Reason} ->
	    {error, Reason}
    end.

%% @doc Callback to application stop event.
%% @private
-spec stop(_) -> ok.
stop(_State) ->
    ok.
