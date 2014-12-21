#!/bin/bash
mvn clean install
docker build -t diabol/slim:ms1 .

