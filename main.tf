terraform {
  backend "remote" {
    organization = "testecorpfabio"

    workspaces {
      name = "zuptest"
    }
  }
}

# AWS resources
provider "aws" {
 region = var.aws_region
}

resource "aws_key_pair" "ec2key" {
  key_name = "publicKey"
  public_key = file(var.public_key_path)
}

resource "aws_instance" "testInstance" {
  ami           = var.aws_instance_ami
  instance_type = var.aws_instance_type
  subnet_id = aws_subnet.subnet_public.id
  vpc_security_group_ids = [aws_security_group.sg_22.id]
  key_name = aws_key_pair.ec2key.key_name
}

# GCP resources

provider "google" {
 credentials = var.gcp_credentials
 project     = var.gcp_project
 region      = var.gcp_region
}

// Create instance

resource "google_compute_instance" "vm_instance" {
  name         = "gcp-instance"
  machine_type = "f1-micro"
  zone         =  "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  network_interface {
    subnetwork       = google_compute_subnetwork.subnet.name
    access_config {
    }
  }

   metadata = {
    ssh-keys = "fabiolrodriguez:${file(var.public_key_path)}"
  }
}

