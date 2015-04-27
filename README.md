hello(1) -- Hello World
===

## SYNOPSIS 

    hello

## DESCRIPTION

* Tell the world hello.
* Make packaging binaries with no dependencies very easy.

This project is built in Travis and has a new deb and RPM built
any time a commit is tagged with vX.Y.

Building of executables should be done in Makefile.  Magic happens
in include.mk and .travis.yml.

If you're not me, you probably also want to edit .travis.yml a bit,
specifically the deploy token since it won't work otherwise.

There are a few ways to do this.  The first way is by running `travis encrypt` and encrypting a personal authentication token with it.  The output goes under the api_key section.  It should look similar to what it does in my .travis.yml.

Also, this can be done by running `travis setup releases --force`.

If you don't have Travis CLI, run `gem install travis`.

You will very much want to copy the file settings from .travis.yml before setting your auth token and restore them after since they're part of the magicalness.  You will also want to keep the tags: true section.

Yes, this is all being included in a man page.  Oh well.

## OPTIONS

    This package has no options.

## AUTHOR

James Andariese <james@strudelline.net>

## COPYRIGHT

Copyright (c) 2015, James Andariese

All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
