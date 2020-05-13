#!/bin/sh

set -e;

nmbd \
  --foreground \
  --no-process-group \
  --log-stdout
