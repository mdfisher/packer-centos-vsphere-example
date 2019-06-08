#!/bin/bash
export HTTP_PROXY=http://michael.fisher:<passwd>@proxy.pxm-lax.intra:3128
export HTTPS_PROXY=http://michael.fisher:<passwd>@proxy.pxm-lax.intra:3128

# Configuring werner-release
echo "$(date +"%Y-%m-%d %H:%M:%S") - $1" > /etc/werner-release

# Installing epel
yum --setopt=proxy=$HTTP_PROXY install -y epel-release

# Installing python-pip
yum --setopt=proxy=$HTTP_PROXY install -y python-pip
yum remove -y epel-release
pip install --proxy=$HTTP_PROXY --upgrade pip

# installing Ansible
pip freeze > /tmp/freeze-begin
pip install --proxy=$HTTP_PROXY --cache-dir /tmp/cache ansible
pip freeze > /tmp/freeze-end
