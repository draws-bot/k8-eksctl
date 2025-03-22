#!/bin/bash

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2... installation is failure"
    exit 1
    else
        echo "$2... installation is success"
    fi
}

# eksctl
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
mv /tmp/eksctl /usr/local/bin


VALIDATE $? "eksctl is success"

# kubectl
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.30.0/2024-05-12/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv kubectl /usr/local/bin/kubectl

VALIDATE $? "kubectl is success"