resource "aws_vpc" "code_vpc1"{

    cidr_block = var.inputs.cidr

    tags = {
      Name = var.inputs.vpc_name
    }
    provisioner "local-exec" {
        command = "echo vpc is created >> log.txt"
      
    }
    /*lifecycle {
      create_before_destroy = true //it will create a vpc before destorying old one
    }*/
}


  
resource "aws_subnet" "r_subnet"{
    vpc_id = aws_vpc.code_vpc1.id

    availability_zone = var.inputs.avail_zone

    cidr_block= var.inputs.sub_cidr

    tags = {
        Name= var.inputs.vpc_name

    }
    /*lifecycle {
      ignore_changes = [ availability_zone,cidr_block ] // this will ingore if changes are done again only previous values will be considered
    }*/
}

resource "aws_internet_gateway" "r-intg"{
    vpc_id = aws_vpc.code_vpc1.id
    tags = {
        Name = var.inputs.ing
    }
}
  

  
resource "aws_route_table" "r_rt"{
    vpc_id = aws_vpc.code_vpc1.id

    route {
    cidr_block=var.inputs.rou_cidr
    gateway_id = aws_internet_gateway.r-intg.id
    }
    tags ={
        Name= var.inputs.rou_name
    }
    }

resource "aws_route_table_association" "r-ta"{

    subnet_id = aws_subnet.r_subnet.id
    route_table_id = aws_route_table.r_rt.id

}
resource "aws_security_group" "r_sg"{
    vpc_id = aws_vpc.code_vpc1.id
    tags = {
        Name = var.inputs.sg_name
    }
    
    description = var.inputs.sg_desc

    ingress {
        to_port = var.inputs.sg_ing_to
        from_port = var.inputs.sg_ing_from
        protocol = var.inputs.sg_ing_port
        cidr_blocks = var.inputs.sg_ing_cidr
        
    }

    ingress {
        to_port = "80"
        from_port = "80"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }   
    egress {
        to_port = var.inputs.sg_eg_to
        from_port = var.inputs.sg_eg_from
        protocol = var.inputs.sg_eg_port
        cidr_blocks = var.inputs.sg_eg_cidr
    }

}
resource "aws_instance" "r_ec2"{

    ami = var.inputs.inst_ami
    instance_type = var.inputs.inst_type
    key_name = var.inputs.inst_key
    vpc_security_group_ids = [aws_security_group.r_sg.id]
    subnet_id = aws_subnet.r_subnet.id
    associate_public_ip_address = true
                          


    tags = {
      Name = var.inputs.inst_name
    }
}

resource "null_resource" "html-page" {

    triggers = {
      build = 1.0
    }

connection {
    type = "ssh"
    private_key = file("~/.ssh/yes")
    user = "ubuntu"
    host = aws_instance.r_ec2.public_ip
  }
provisioner "file" {
    source = "nginx.sh"
    destination = "/tmp/nginx.sh"

  }
provisioner "remote-exec" {
    inline = [ "sudo chmod +x /tmp/nginx.sh", "bash /tmp/nginx.sh" ]
    
  }
}
resource "null_resource" "localpage"{
    triggers= {
        local-build = 1.1
    }
    provisioner "local-exec" {
      command = "echo ${aws_instance.r_ec2.public_ip} is my public ip > log.txt"
    }

}

resource "aws_ebs_volume" "myvol" {
    availability_zone = aws_subnet.r_subnet.availability_zone
    size = 15
    type = "gp3"
    tags = {
      Name = "myvolume"
    }
  
}

resource "aws_s3_bucket" "ser_s3" {
    bucket = "rishi2272"

    tags={
        Name = "mys3"
        environment = "dev1"
    }

/*lifecycle {
  prevent_destroy = true  //even though terraform destroy is performed still bucket will not be destroyed
}*/

  
}

resource "aws_volume_attachment" "vol_attach" {
    device_name = "/dev/sdh"
    volume_id = aws_ebs_volume.myvol.id
    instance_id = aws_instance.r_ec2.id
  
}