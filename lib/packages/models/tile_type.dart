enum TileType {
  text('Text', '{}'),
  toggle('Switch', '{"left": "", "right": ""}'),
  button('Button', '{"value": ""}'),
  ;

  final String value;
  final String initialLob;
  const TileType(this.value, this.initialLob);
}
