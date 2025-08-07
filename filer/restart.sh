#!/bin/bash
set -e

cd /uploads/incoming && ncat -l -p 9899 | tar xvf -