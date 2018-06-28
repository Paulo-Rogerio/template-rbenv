#!/bin/bash

## Clear apt-get
apt-get -yq clean autoclean && rm -rf /var/lib/apt/lists/*

## Remove build scripts
rm -rf /scripts-bash
