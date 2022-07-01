# packer-lxd

Customise and build LXD images using Packer + Ansible

## Pre-requisites

* LXD
* Ansible
* Packer (Installation script provided in repo if needed)

## Tested on

* Ubuntu 22.04

## Running the code

To build a new image customised via the [Ansible playbook](ansible/playbooks/site.yml)

```sh
git clone https://github.com/AdamGoldsmith/packer-lxd.git
cd packer-lxd
./install_packer.sh
cd packer
packer build lxd-ansible-local.json.pkr.hcl
```

# References

* Referenced material at [Blagovest Petrov's great blog site](https://petrovs.info/post/2020-11-03-building-lxd-with-packer/)
* [Honour Ansible output colouring](https://github.com/hashicorp/packer-plugin-ansible/issues/16#issuecomment-990284673)

# Notes

* localhost commands will run as root by default
