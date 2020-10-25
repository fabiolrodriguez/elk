terraform {
  backend "remote" {
    organization = "testecorpfabio"

    workspaces {
      name = "elk"
    }
  }
}




