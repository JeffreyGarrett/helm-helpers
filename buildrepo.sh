#!/bin/bash

# lint all charts
helm lint source/*
echo "do you want to continue? -- only accepts y"

read input

if [ "$input" = "y" ]; then
    echo "deploying building charts"
    helm package source/*

    echo "rebuilding index"
    helm repo index --url https://jeffreygarrett.github.io/helm-helpers/ .
   else
    echo "stopping"
fi



