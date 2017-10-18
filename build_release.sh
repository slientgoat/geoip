#!/bin/bash
if [ "$1" != "" ]
then
  mix_env=$1
else
  mix_env="prod"
fi

check_error(){
  if [ $? != 0 ]
  then
    echo $1
    exit 1
  fi
}

#
# pack front-end
#


#
# pack back-end
#

get_deps(){
  echo "mix deps.get ..."
  mix deps.get
  check_error "Deps.get failed!"
}
release_init(){
  echo "MIX_ENV=$mix_env mix release.init ..."
  MIX_ENV="$mix_env" mix release.init
  check_error "Compile failed!"
}
release(){
  echo "MIX_ENV=$mix_env mix release ..."
  MIX_ENV="$mix_env" mix release
  check_error "Release failed!"
}
get_deps
release_init
release
echo "Build release succeed!"
