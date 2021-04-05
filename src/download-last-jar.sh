# Source : https://gist.github.com/lukechilds/a83e1d7127b78fef38c2914c4ececc3c
get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

RESTCLI_RELEASE_URL=https://github.com/restcli/restcli/releases/download/`get_latest_release "restcli/restcli"`/restcli.zip;

curl -L \
  -o restcli.zip \
  ${RESTCLI_RELEASE_URL};

unzip restcli.zip;
ls restcli.jar;
rm -rf restcli.zip;
