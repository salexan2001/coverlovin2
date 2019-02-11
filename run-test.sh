#!/usr/bin/env bash

set -e
set -u
set -x

cd "$(dirname -- "${0}")"

python3 -m pip install pipenv
#python3 -m pipenv install --dev
pipenv install --dev
echo
echo
pytest -v .
