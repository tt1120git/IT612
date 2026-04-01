#!/bin/bash

LOG="bash/test_log"

# grep IPs from the log, replace the last octet with .0 using sed,
# then use awk to print each unique transformed IP.


grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' "$LOG" \
  | sed 's/\([0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\)\.[0-9]\{1,3\}/\1.0/' \
  | awk '!seen[$0]++ {print}'

