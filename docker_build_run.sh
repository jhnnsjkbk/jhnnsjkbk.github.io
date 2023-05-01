#!/usr/bin/env bash
# use the two following commands to
# 1. build the required image
docker build -t jhnnsjkbk-jekyll .
# 2. create a container and launch the jekyll server
docker run -tdp 4000:4000 jhnnsjkbk-jekyll
# website will be accessible here: http://0.0.0.0:4000/ or localhost:4000
