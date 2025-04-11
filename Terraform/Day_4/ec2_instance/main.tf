resource "aws_instance" "server1" {
    ami=var.ami_val
    instance_type = var.instance_type_val
    tags={
        Name="server1"
    }

  
}