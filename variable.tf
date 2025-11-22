  variable "inputs"{

    type = object({
      cidr = string
      vpc_name = string

      avail_zone= string
      sub_cidr = string
      sub_name = string

       ing = string
       rou_name = string
       rou_cidr=string

       sg_name = string
       sg_desc = string

       sg_ing_to = string
       sg_ing_from = string
       sg_ing_port = string

       
       sg_ing_cidr = list(string)
       
       

       sg_eg_to = string
       sg_eg_from = string
       sg_eg_port = string

       
         sg_eg_cidr = list(string)
       
       

       inst_ami = string
       inst_name = string
       inst_key = string
       inst_type = string

    })
  }
      /*default = {
      cidr = "10.0.0.0/16"
      vpc_name = "vpc1"

      avail_zone= "ap-south-1a"
      sub_cidr = "10.0.0.0/24"
      sub_name = "sub1"

       ing = "int_terra"
       rou_name = "rt_terra"
       rou_cidr= "0.0.0.0/0"

       sg_name = "sg_terra"
       sg_desc = "allowing http and ssh ports"

       sg_ing_to = "22"
       sg_ing_from = "22"
       sg_ing_port = "tcp"
       sg_ing_cidr = ["0.0.0.0/0"]

       sg_eg_to = "0"
       sg_eg_from = "0"
       sg_eg_port = "-1"
       sg_eg_cidr = ["0.0.0.0/0"]

       inst_ami = "ami-02b8269d5e85954ef"
       inst_name = "inst_terra"
       inst_key = "docker.key"
       inst_type = "t2.micro"
    }

}





/*variable "vpc_cidr"{

    type= string
    default = "10.0.0.0/16"

}
  
variable "vpc-name"{
    type = string
    default = "vpc1"

}
  
variable "sub1-az"{
    type = string
    default = "ap-south-1a"
}
variable "sub1-cidr"{
    type = string
    default = "10.0.0.0/24"
}
variable "sub1-name"{
    type = string
    default = "subnet1"
}
variable "intg-name"{
    type = string
    default = "intg-terra"

}
variable "routet-name"{
    type = string
    default = "rt_terraform"
  
}
variable "route-cd"{
    type = string
    default = "0.0.0.0/0"

}
variable "sg_name"{
    type = string
    default = "sg-terra"
}
variable "sg-desc"{
    type = string
    default = "allowing ssh and http port"

}
variable "sg-ingress_toport"{
    type = string
    default = "22"
}
variable "sg-ingress_fromport"{
    type = string
    default = "22"
}
variable "sg-ingress_protocol"{
    type = string
    default = "tcp"
}
variable "sg-ingress_cidr"{
    type = string
    default = "0.0.0.0/0"
}
variable "sg-exgress_toport"{
    type = string
    default = "0"
}
variable "sg-exgres_fromport"{
    type = string
    default = "0"
}
variable "sg-exgress_protocol"{
    type = string
    default = "-1"
}
variable "sg-exgress_cidr"{
    type = string
    default = "0.0.0.0/0"
}
variable "instance_ami"{
    type = string
    default = "ami-02b8269d5e85954ef"

}
variable "inst_type"{
    type = string
    default = "t2.micro"
}
variable "inst_key"{
    type = string
    default = "docker.key"
}
variable "inst_name"{
    type = string
    default = "server-terra"
}*/
  
