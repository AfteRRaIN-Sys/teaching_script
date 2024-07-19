#!/bin/bash

echo "env : $ENV_VAR"
echo "local : $LOCAL_VAR"

# try doing some operations
export FROM_INSIDE="test from new shell"
FROM_INSIDE_LOCAL="test from inside (local)"
