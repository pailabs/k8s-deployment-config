#!/bin/bash    

echo '$1 = ' $1
echo '$2 = ' $2
echo '$3 = ' $3

GHUSER=$1 
GHREPO=$2
GIT_PATH=$3

# kubectl create ns flux

fluxctl install \
    --git-user=${GHUSER} \
    --git-email=${GHUSER}@users.noreply.github.com \
    --git-url=git@github.com:${GHUSER}/${GHREPO} \
    --git-path=${GIT_PATH} \
    --namespace=flux | cat