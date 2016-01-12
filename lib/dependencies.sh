install_node_modules() {
  local build_dir=${1:-}
  export PATH="$BUILD_DIR/vendor:$BUILD_DIR/vendor/include:$BUILD_DIR/vendor/lib:$BUILD_DIR/.heroku/vendor/:/app/.heroku/vendor/lib:$BUILD_DIR/.heroku/vendor/lib:/app/.heroku/vendor/include:$BUILD_DIR/.heroku/vendor/include":$PATH
  pwd
  ls -lrt
  echo "build dir:" $build_dir
  if [ -e $build_dir/package.json ]; then
    cd $build_dir
    echo "Pruning any extraneous modules"
    npm prune --unsafe-perm --userconfig $build_dir/.npmrc 2>&1
    if [ -e $build_dir/npm-shrinkwrap.json ]; then
      echo "Installing node modules (package.json + shrinkwrap)"
    else
      echo "Installing node modules (package.json)"
    fi
    npm install --unsafe-perm --userconfig $build_dir/.npmrc 2>&1
  else
    echo "Skipping (no package.json)"
  fi
}

rebuild_node_modules() {
  local build_dir=${1:-}

  if [ -e $build_dir/package.json ]; then
    cd $build_dir
    echo "Rebuilding any native modules"
    npm rebuild 2>&1
    if [ -e $build_dir/npm-shrinkwrap.json ]; then
      echo "Installing any new modules (package.json + shrinkwrap)"
    else
      echo "Installing any new modules (package.json)"
    fi
    npm install --unsafe-perm --userconfig $build_dir/.npmrc 2>&1
  else
    echo "Skipping (no package.json)"
  fi
}
