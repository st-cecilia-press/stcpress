#!/bin/bash
set -e
declare -a repos=('bel-accueil' 'gervaise_quart_livre_de_danceries' 'miscellaneous' 'sca_dance' 'stcpress-data')
for val in ${repos[@]}; do
  if [ ! -f public/$val ]; then
    `ln -s ../../shared/$val public/$val`
  fi
done
exec "$@"
