
inputs ={
      cidr = "10.0.0.0/16"
      vpc_name = "vpc1-terra"

      avail_zone= "ap-south-1a"
      sub_cidr = "10.0.0.0/24"
      sub_name = "sub1-terra"

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

