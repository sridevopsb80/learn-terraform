#this is the root module. child modules(ec2, dns) are being called here. child modules can be stored locally or in vcs such as git.
#refer miro to check how output from ec2 module is being sent to dns module as input

module "ec2" {
  source = "./ec2"
}

module "dns" {
  source     = "./dns"
  private_ip = module.ec2.private_ip #output value private ip taken from ec2 module
}

