#!/usr/bin/env bash

set -o errexit
set -o pipefail

# Check if env vars are set - if not assign defaults
if [[ -z ${FLASK_APP} ]]; then
  FLASK_APP=app.py
else
  FLASK_APP=$FLASK_APP
fi

if [[ -z ${FLASK_ENV} ]]; then
  FLASK_ENV=production
else
  FLASK_ENV=$FLASK_ENV
fi

flask run --host=0.0.0.0
