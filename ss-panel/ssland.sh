#!/bin/bash

echo type: './tools/setup.sh' to setup. For demo only, data cleared after exit.

docker run --name ssland --net host -it --rm fzinfz/ss-panel:py-bottle-ssland /bin/bash

