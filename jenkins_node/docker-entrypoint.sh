#!/bin/bash
set -e

cp -f -r  /root/.m2/settings_*.xml /usr/share/maven/conf/
exec "$@"
