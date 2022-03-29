class Pokemon {
  final String name;
  final int height;
  final int weight;

  const Pokemon({
    required this.name,
    required this.height,
    required this.weight,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      height: json['height'],
      weight: json['weight'],
    );
  }
}