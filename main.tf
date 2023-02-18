resource "aws_vpc" "demo_vpc"{
cidr_block = "10.0.0.0/16"

tags = {
Name  = "demo_vpc"
}
}

resource "aws_subnet" "public_subnet"{
vpc_id = aws_vpc.demo_vpc.id
cidr_block = "10.0.1.0/24"

tags = {

Name = "public_subnet"
}
}

resource "aws_internet_gateway" "igw"{
vpc_id = aws_vpc.demo_vpc.id

tags = {

Name = "igw"
}
}

resource "aws_route_table" "public_rt"{
vpc_id = aws_vpc.demo_vpc.id

route{

cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.igw.id
}
}

resource "aws_route_table_association" "pub_rt_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}
