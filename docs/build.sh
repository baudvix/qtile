#!/bin/sh

while [ true ]; do
    #rm -rf _build/*
    make html
    sleep 5
done
