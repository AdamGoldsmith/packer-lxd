# This file was autogenerated by the 'packer hcl2_upgrade' command. We
# recommend double checking that everything is correct before going forward. We
# also recommend treating this file as disposable. The HCL2 blocks in this
# file can be moved to other files. For example, the variable blocks could be
# moved to their own 'variables.pkr.hcl' file, etc. Those files need to be
# suffixed with '.pkr.hcl' to be visible to Packer. To use multiple files at
# once they also need to be in the same folder. 'packer inspect folder/'
# will describe to you what is in that folder.

# Avoid mixing go templating calls ( for example ```{{ upper(`string`) }}``` )
# and HCL2 calls (for example '${ var.string_value_example }' ). They won't be
# executed together and the outcome will be unknown.

# source blocks are generated from your builders; a source can be referenced in
# build blocks. A build block runs provisioner and post-processors on a
# source. Read the documentation for source blocks here:
# https://www.packer.io/docs/templates/hcl_templates/blocks/source
source "lxd" "itc-jammy" {
  image        = "ubuntu:jammy"
  init_sleep   = "10"
  output_image = "packer-itc_ubuntu-22.04"
  publish_properties = {
    description = "22.04 image by ITC"
  }
}

# a build block invokes sources and runs provisioning steps on them. The
# documentation for build blocks can be found here:
# https://www.packer.io/docs/templates/hcl_templates/blocks/build
build {
  sources = ["source.lxd.itc-jammy"]

  provisioner "ansible" {
    playbook_file = "../ansible/playbooks/site.yml"
    inventory_file = "../ansible/inventory"
    ansible_env_vars = ["ANSIBLE_FORCE_COLOR=1"]
    // extra_arguments = [
    //   "-vvvvv"
    // ]
  }

}
