# #!/bin/bash
# #

#PREREQUISITES INSTALLATION 
echo "-----------------------------------"
echo "|***PREREQUISITES INSTALLATION ***|"
echo "-----------------------------------"
echo " "
echo "|***CURL Installation***|"
echo " "
sudo apt-get install curl

echo " "
echo "|***go Installation***|"
echo " "
sudo apt-get install golang

echo " "
echo "|***exporting gopath***|"
echo " "
export GOPATH=$HOME/go

export PATH=$PATH:$GOPATH/bin

echo " "
echo "|***nodejs Installation***|"
echo " "
sudo apt-get install nodejs

echo " "
echo "|***npm Installation***|"
echo " "
sudo apt-get install npm

echo " "
echo "|***python Installation***|"
echo " "
sudo apt-get install python

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
	   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
	   $(lsb_release -cs) \
	   stable" 

echo " "
echo "|***UPDATE***|"
sudo apt-get update
echo " "

echo " "
echo "|***Docker Installation***|"
echo " "
apt-cache policy docker-ce

sudo apt-get install -y docker-ce

echo " "
echo "|***docker compose Installation***|"
echo " "
sudo apt-get install docker-compose

echo " "
echo "|***UPGRADE***|"
echo " "
sudo apt-get upgrade

echo " "
echo "|***Get go version 1.13.9***|"
echo " "
wget https://dl.google.com/go/go1.13.9.linux-amd64.tar.gz

echo " "
echo "|***Extracting tar.gz***|"
echo " "
tar xf go1.13.9.linux-amd64.tar.gz

sudo mv go /usr/local/go-1.13

echo " "
echo "|***Export Path***|"
echo " "
export GOROOT=/usr/local/go-1.13

export PATH=$GOROOT/bin:$PATH

export GOPATH=/usr/local/go

export PATH=$PATH:$GOPATH/bin

echo " "
echo "|***images and fabric-samples repo version 2.2.0***|"
curl -sSL https://bit.ly/2ysbOFE | bash -s 2.2.0
echo " "

echo " "
echo "|***move the downloaded folders to the right place inside the folder fabric-samples ***|"
mv ./bagTrack/bagTrack ./fabric-samples/
mv ./bagTrack/chaincode/baggage ./fabric-samples/chaincode/
mv ./network ./fabric-samples/

cd fabric-samples/bagtrack

chmod +x ricarica.sh

./startFabric.sh

echo "Now you can move inside bagtrack/javascript"
echo "Enjoy the prototype!! ;)"
