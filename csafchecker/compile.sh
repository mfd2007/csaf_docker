cd /root
git clone https://github.com/csaf-poc/csaf_distribution.git
cd ./csaf_distribution/

#git fetch origin pull/260/head:test_branch
#git checkout test_branch

export PATH=$PATH:/usr/local/go/bin
make build_linux
cp ~/csaf_distribution/bin-linux-amd64/csaf_checker /usr/local/csaf_checker
cd /root
rm -rf ./csaf_distribution/