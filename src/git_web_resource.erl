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
-module(git_web_resource).

%% API
-export([init/1,
         to_html/2]).

-include_lib("webmachine/include/webmachine.hrl").

init(Config) ->
    PrivDir = code:priv_dir(git_web),
    TraceDir = PrivDir ++ "/traces",
    ok = filelib:ensure_dir(TraceDir ++ "/arbitrary_filename.txt"),
    { {trace, TraceDir}, Config}.
%%{ok, Config}.

to_html(ReqData, State) ->
    {"<html><body>Hello, world (no autorization required)</body></html>", ReqData, State}.
