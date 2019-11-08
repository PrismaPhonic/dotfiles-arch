# Install aws cli
sudo pacman -Sy aws-cli
aws configure

# Install gcloud sdk (includes cli)
yay -S google-cloud-sdk
gcloud init

# make paths
mkdir -p $GOPATH/src/github.com/planetscale

# Set the release version variable
RELEASE_VERSION=v0.10.0
curl -OJL https://github.com/operator-framework/operator-sdk/releases/download/${RELEASE_VERSION}/operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu

# Verify the download release binary
curl -OJL https://github.com/operator-framework/operator-sdk/releases/download/${RELEASE_VERSION}/operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu.asc

gpg --recv-key "0CF50BEE7E4DF6445E08C0EA9AFDE59E90D2B445"
gpg --verify operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu.asc

sudo chmod +x operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu \
&& sudo cp operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu /usr/local/bin/operator2-sdk-v0.10.0

rm operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu && rm operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu.asc

# Install gen-crd-api-reference-docs dep
cd /tmp
GO111MODULE=on go get github.com/ahmetb/gen-crd-api-reference-docs

# Download the godoc server
go get golang.org/x/tools/cmd/godoc

# Clone mono-repo
cd $GOPATH/src/github.com/planetscale/
git clone git@github.com:planetscale/planetscale-operator.git

# Configure docker to use minikube daemon before we build
eval $(minikube docker-env)

# Build operator2
cd planetscale-operator2 && make build 
