#!/bin/sh
# Install the ForensicsAdapter environment with uv (https://docs.astral.sh/uv/).
#
# All dependencies are pinned in pyproject.toml and the interpreter is pinned in
# .python-version (3.9). Just run `uv sync` - this script is only a thin wrapper
# that also works from any directory.
#
#   uv sync                 # create/refresh ./.venv (Python 3.9)
#   source .venv/bin/activate
#   uv run python train.py  # ...or run commands without activating
#
# Notes:
#   * uv downloads a standalone CPython 3.9 build if the server has none.
#   * dlib==19.24.0 is compiled from source: needs cmake and a C++ compiler.
#   * To install into an already activated environment (e.g. conda), use
#     `uv sync --active` instead.
set -eu

cd "$(dirname "$0")"
exec uv sync "$@"
