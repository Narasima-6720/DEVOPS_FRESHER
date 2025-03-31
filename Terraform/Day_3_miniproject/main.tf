#intialize the provider
provider "aws"{
    region = "us-east-1"
}

# 1.Create a VPC 

resource "aws_vpc" "myprod_vpc" {
    cidr_block       = "192.12.0.0/16"
    instance_tenancy = "default"

  tags = {
    Name = "myprod_vpc"
  }
  
}

# # 2. create a Internet Gateway attach to VPC
resource "aws_internet_gateway" "myprod_igw" {
    vpc_id = aws_vpc.myprod_vpc.id
    tags = {
        Name ="my_prod_igw"
    }
  
}

# # 3. Create the Route Table 

resource "aws_route_table" "myprod_rt" {
    vpc_id = aws_vpc.myprod_vpc.id
    tags = {
      Name ="myprod_rtb"
    }
    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myprod_igw.id
  }
  
}

# # 4. Craete the Public Subnet
resource "aws_subnet" "myprod_sub" {
    vpc_id = aws_vpc.myprod_vpc.id
    cidr_block = "192.12.3.0/24"
    tags = {
      Name = "myprod_sub"
    }
  
}

# 5. Associate the Subnet to the Route Table
resource "aws_route_table_association" "myprod_rta" {
    subnet_id = aws_subnet.myprod_sub.id
    route_table_id = aws_route_table.myprod_rt.id
   
}
# # 6. Create the Security Group that should allow the port 22,80,443

resource "aws_security_group" "myprod_sg" {
    name = "My sg for vpc and the subnets"
    description = "This allow traffic to the VPC and the Subnets"
    vpc_id = aws_vpc.myprod_vpc.id
 #Inbound Rules
    ingress  {
        from_port =22
        to_port=22
        protocol="tcp"
        cidr_blocks=["0.0.0.0/0"]
    }
       ingress  {
        from_port =80
        to_port=80
        protocol="tcp"
        cidr_blocks=["0.0.0.0/0"]
    }
       ingress  {
        from_port =443
        to_port=443
        protocol="tcp"
        cidr_blocks=["0.0.0.0/0"]
    }
    #Outbound Rules
    egress  {
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]
    }
  
}
# 7. Create the nework interfaces that is associate to the Subnet
resource "aws_network_interface" "prod_nic" {
    subnet_id = aws_subnet.myprod_sub.id
    private_ips =["192.12.3.33"]
    security_groups = [aws_security_group.myprod_sg.id]
    tags = {
      Name="myprod_nic"
    }
  
}

# # 8. Assign Elastic ip to the network interfaces 
resource "aws_eip" "myprod_eip" {
    network_interface = aws_network_interface.prod_nic.id
    associate_with_private_ip = "192.12.3.33"
    tags={
        Name = "myprod_eip"

    }
  
}
# # 9. Create the EC2 instance -- Deploy the Application
resource "aws_instance" "myprod_server" {
    ami = "ami-071226ecf16aa7d96"
    instance_type = "t2.micro"
    key_name = "Ansiblekey"
   
    tags = {
      Name = "myprod_srv"
    }
    user_data = "${file("app.sh")}"
    network_interface {
      
        network_interface_id = aws_network_interface.prod_nic.id 
        device_index=0


        
      }
    }


  

# # 10. Output the public Ip to access the Application 
output "my_srv_ip" {
    value = aws_instance.myprod_server.public_ip

  
}

