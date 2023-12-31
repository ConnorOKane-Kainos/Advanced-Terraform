/*
Associates public and private subnets with their respective route tables.
- The "public" association links all public subnets to the first public route table.
- The "private" association links each private subnet to its corresponding private route table.
Dependencies ensure route tables exist before association.
*/

resource "aws_route_table_association" "public" {
  count = length(aws_subnet.public)

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public[0].id

  depends_on = [aws_route_table.public]
}

# Associate correct route tables with subnets
resource "aws_route_table_association" "private" {
  count = length(aws_subnet.private)

  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = element(aws_route_table.private.*.id, count.index)

  depends_on = [aws_route_table.private]
}