#!/bin/bash
if [ ! -f "${HOME}/.nvm/nvm.sh" ]; then
  echo "nvm not installed"
  exit 1
fi
# load nvm
. ~/.nvm/nvm.sh
# node version
nodev=$(node -v 2>/dev/null)
if [ -z "$nodev" ]; then
  echo "node not installed"
  exit 2
else
  echo "node: $nodev"
fi
# clean up
if [ -d "dist" ]; then
  rm -rf dist
fi
echo "installing dependencies..."
nvm install 12 &>/dev/null
if [ ! -d "node_modules" ]; then
  npm install &>/dev/null
fi
echo "building..."
npm run build >/dev/null
echo "done"