resource "aws_route_table_association" "mukesh-subnet-assoc" {
  route_table_id = aws_route_table.mukesh-public-route.id
  subnet_id      = aws_subnet.mukesh_public_subnet_1.id

}