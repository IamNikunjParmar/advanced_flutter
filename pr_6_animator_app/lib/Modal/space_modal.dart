class GalaxyModal {
  String position;
  String name;
  String image;
  String velocity;
  String distance;
  String description;

  GalaxyModal({
    required this.position,
    required this.name,
    required this.image,
    required this.velocity,
    required this.distance,
    required this.description,
  });

  factory GalaxyModal.fromMap({required Map data}) {
    return GalaxyModal(
      position: data["position"],
      name: data["name"],
      image: data["image"],
      velocity: data["velocity"],
      distance: data["distance"],
      description: data["description"],
    );
  }
}