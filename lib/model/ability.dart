class Ability {
  bool checked;
  String title;
  String category;
  String image;
  dynamic description;

  Ability({
    required this.checked,
    required this.title,
    required this.category,
    required this.image,
    required this.description,
  });

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        // var abilityDescription = json["description"];
        // List<String> descrList = new List<String>.from(abilityDescription);

        checked: json['checked'],
        title: json['title'].toString(),
        category: json['category'].toString(),
        image: json['image'].toString(),
        description: json['description'].toString(),
      );
}
