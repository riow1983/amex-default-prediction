#!/usr/bin/env bash

set -eo pipefail
set -x

docker build -t jupyter .
exec docker run --rm -it -p 8888:8888 -v "$(pwd)/notebooks:/opt/notebooks" jupyter /bin/bash -c "/opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --allow-root --ip='0.0.0.0' --port=8888 --no-browser"