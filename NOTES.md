# Notes

1. Referenced material at this great [website](https://petrovs.info/post/2020-11-03-building-lxd-with-packer/)
1. Get list of avalaible LXC images `wget https://images.linuxcontainers.org/streams/v1/images.json`
1. Converted the packer JSON to HCL using packer's `hcl2_upgrade` option
1. Tried hard to use `Ansible` provisoner rather than `ansible-local` as I didn't want to install Ansible on the target to avoid bloat (yes this could have been removed later but that is an extra step).

I managed to get `ansible` provisioner working but not in the best dynamic setup unfortunately.

I pointed the inventory file to a static file which needed the LXC hostname in there. In a separate exercise, independent of packer, I tried to get Ansible to connect to an LXC container using a mixture of the LXD dynamic inventory plugin and the LXD connection plugin, but no matter what I tried, I couldn't get Ansible to use the LXD connection when using the LXD dynamic host plugin. I have been able to set group vars via combination of static and dynamic inventory sources before, but this will not connect correctly when using the LXC connection plugin (fine for SSH but have to pre-configure SSH keys/authorized_keys). Maybe it can be done with further perseverance. For the meantime I will just use a static inventory and define the known names of the containers in there - annoying but at least it works.

See: https://github.com/ansible-collections/community.general/issues/4851
