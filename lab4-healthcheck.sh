#!/usr/bin/env bash
set -euo pipefail

STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://127.0.0.1:8000/ 2>/dev/null || echo "000")

if [ "$STATUS" = "200" ]; then
  echo "OK: Service is healthy (HTTP $STATUS)"
  exit 0
else
  echo "FAIL: Service is unhealthy (HTTP $STATUS)"
  exit 1
fi
