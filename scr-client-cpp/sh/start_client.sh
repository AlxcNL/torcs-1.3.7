#!/usr/bin/env bash

(cd ..; date > logs/torcs_client.log; ./client >> logs/torcs_client.log)