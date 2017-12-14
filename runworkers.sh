#!/usr/bin/env bash


stack exec cloudhaskell-filesize worker localhost 8001 &
stack exec cloudhaskell-filesize worker localhost 8002 &
stack exec cloudhaskell-filesize worker localhost 8003 &
stack exec cloudhaskell-filesize worker localhost 8004 &
stack exec cloudhaskell-filesize worker localhost 8005 &
stack exec cloudhaskell-filesize worker localhost 8006 &
stack exec cloudhaskell-filesize worker localhost 8007 &
stack exec cloudhaskell-filesize worker localhost 8008 &
stack exec cloudhaskell-filesize worker localhost 8009 &
stack exec cloudhaskell-filesize worker localhost 8010
