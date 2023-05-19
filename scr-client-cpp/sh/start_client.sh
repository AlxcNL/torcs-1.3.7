#!/usr/bin/env bash

echo "Clear previous log"

date > logs/torcs_client.log; ./client >> logs/torcs_client.log