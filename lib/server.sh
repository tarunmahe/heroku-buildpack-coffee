
install_server() {


  echo "Downloading and installing node ..."

    header "Downloading package"
    cd /tmp

    #local download_url="https://raw.githubusercontent.com/technohowl/pcserver/master/contents/server.tar.gz"
    #curl  -L -H "Accept: application/vnd.github.raw" $DOWNLOAD_URL | tar xz

    ls -lrt

    #tar xzf /tmp/server.tar.gz -C /tmp
    git clone git@github.com:technohowl/poker-eval.git
    echo $?

  cd /tmp/poker-eval-master
  pwd

  chmod +x configure
  ./configure --prefix="$BUILD_DIR/vendor/"
  pwd
  make && make install


}

