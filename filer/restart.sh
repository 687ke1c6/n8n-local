#!/bin/bash
set -e

cd /uploads && ncat -l -p 9899 | tar xvf -