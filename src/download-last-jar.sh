# Source : https://gist.github.com/lukechilds/a83e1d7127b78fef38c2914c4ececc3c
get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

# Usage
# $ get_latest_release "creationix/nvm"
# v0.31.4

curl https://api.github.com/repos/restcli/restcli/releases/latest;

export TAG=`get_latest_release "restcli/restcli"`;
export RESTCLI_RELEASE_URL=https://github.com/restcli/restcli/releases/download/${TAG}/restcli.zip;
echo ${RESTCLI_RELEASE_URL}

curl -L \
  -o restcli.zip \
  ${RESTCLI_RELEASE_URL}
unzip restcli.zip;
ls restcli.jar;
rm -rf restcli.zip;
