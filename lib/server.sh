
install_server() {


  echo "Downloading and installing node ..."

    header "Downloading package"

    cd $BUILD_DIR
    mkdir -p $VENDOR_DIR
    cd $VENDOR_DIR


  local download_url="https://github.com/technohowl/poker-eval/archive/master.tar.gz"
  curl "$download_url" --silent --fail -o /tmp/server.tar.gz || (echo "Unable to download server  does it exist?" && false)
  tar xzf /tmp/server.tar.gz -C /tmp
  mv -f /tmp/poker-eval-master $dir/poker-eval

  cd $dir/poker-eval
  pwd

  chmod +x configure
  ./configure --prefix="$BUILD_DIR/vendor"
  pwd
  make && make install


}

