#!/bin/bash

# Run the command and capture both stdout and stderr
output=$(kubectl exec -n apparmor pods/deny-write-pod -- touch /test.txt 2>&1)

# Check for 'Permission denied' in the output
if [[ "$output" == *"Permission denied"* ]]; then
  echo "Write operation correctly denied"
  exit 0
else
  echo "Unexpected result:"
  echo "$output"
  exit 1
fi
