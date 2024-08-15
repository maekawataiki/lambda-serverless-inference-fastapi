#!/usr/bin/env bash -e

# # make sure rust compiler is installed (needed for huggingface transformers lib)
# curl 'https://sh.rustup.rs' —-tlsv1.2 -sSf  | bash
# source "$HOME/.cargo/env"

# setup and activate virtual environment
python3 -m venv .venv
source .venv/bin/activate

# install dependencies inside virtual environment
pip install --upgrade pip
pip install -r requirements.txt

