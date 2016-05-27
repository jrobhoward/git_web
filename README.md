git_web
=============

Last Modified: 2016-05-27

License
=======

Copyright (c) 2016 jrobhoward (jrobhoward@gmail.com)

This file is provided to you under the Apache License,
Version 2.0 (the "License"); you may not use this file
except in compliance with the License.  You may obtain
a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.


Introduction
============
REST service with two endpoints:
  * List all managed git repositories
  * Create a new git repository

Enables basic remote access in the presence of a restricted shell.

Build Everything
================

    make

Running (release)
=================

    tar zxvf rel_git_web-0.0.1.tar.gz
    cd bin
    ./rel_git_web start
    ./rel_git_web stop
    ./rel_git_web console


Compile
==============

    make compile

Build Documentation
===================

    make doc
    Doc Results: ./doc/index.html

Run Unit + Integration Tests
==============

    make test
    Unit Test Results: ./_build/test/cover/index.html

Release
==============

    make release
    Release Location: ./_build/default/rel/rel_git_web/rel_git_web-0.0.1.tar.gz
