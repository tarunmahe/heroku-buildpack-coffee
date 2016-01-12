
install_server() {


  echo "Downloading and installing node ..."

    header "Downloading package"

  cd $BUILD_DIR/vendor/poker-eval
  pwd

  chmod +x configure
  ./configure --prefix="$BUILD_DIR/vendor/bin/"
  pwd
  make && make install


}

