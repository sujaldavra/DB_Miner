class Aplanet {
  final String plan;
  final String price;
  final String image;

  Aplanet({
    required this.plan,
    required this.price,
    required this.image,
  });

  factory Aplanet.fromAnimal({required Map<String, dynamic> e}) {
    return Aplanet(
      plan: e['plan'],
      price: e['price'],
      image: e['image'],
    );
  }
}
