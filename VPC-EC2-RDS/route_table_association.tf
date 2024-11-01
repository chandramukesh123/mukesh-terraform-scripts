resource "aws_route_table_association" "Dev_public_rt_association" {
  subnet_id = aws_subnet.dev_public_subnet.id
  route_table_id = aws_route_table.Dev_public_route_table.id

}

resource "aws_route_table_association" "Dev_private_rt_association" {
  subnet_id = aws_subnet.dev_private_subnet1.id
  route_table_id = aws_route_table.Dev_private_route_table.id
}
