#!/usr/bin/env bash
# ref https://github.com/box-cutter/centos-vm/

export HTTPS_PROXY=http://michael.fisher:<passwd>@proxy.pxm-lax.intra:3128

for dep in $(comm -3 /tmp/freeze-begin /tmp/freeze-end | awk -F '=' '{print $1}');do
    echo "Uninstalling $dep"
    pip uninstall -y $dep
done
pip uninstall -y ansible

rm -rf /etc/ssh/ssh_host_* /var/lib/NetworkManager/* /tmp/* /var/log/*
yum -y clean all
rm -rf /var/cache/yum /etc/yum.repos.d/*
history -c
sync
