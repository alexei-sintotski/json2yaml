#!/bin/bash -ex

dartfmt --overwrite --fix --line-length=120  "$@" .
