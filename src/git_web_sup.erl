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
-module(git_web_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

%% ===================================================================
%% API functions
%% ===================================================================

%% @doc Starts the git_web supervisor process and simultaneously
%%      links to it.
-spec start_link() -> {ok, pid()}.
start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

%% @doc This is the callback function associated with the
%%      supervisor:start_link() event.  Start the webmachine process.
%%      Allow 5 restarts within 10 seconds before the supervisor dies.
%% @private
init([]) ->
    Web = {webmachine_mochiweb,
           {webmachine_mochiweb, start, [git_web_config:web_config()]},
           permanent, 5000, worker, [mochiweb_socket_server]},
    Processes = [Web],
    {ok, { {one_for_one, 5, 10}, Processes} }.
