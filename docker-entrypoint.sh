#!/bin/bash
set -e
declare -a repos=('bel-accueil' 'gervaise_quart_livre_de_danceries' 'miscellaneous' 'sca_dance' 'stcpress-data')
for val in ${repos[@]}; do
  if [ -d /usr/src/shared/$val ] && [ ! -e /usr/src/app/public/$val ]; then
    `ln -s /usr/src/shared/$val /usr/src/app/public/$val`
  fi
done
exec "$@"
