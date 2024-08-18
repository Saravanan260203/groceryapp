// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductDataModel {
  final String id;
  final String name;
  final double rating;

  final String description;
  final double price;
  final String imageurl;
  ProductDataModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.description,
    required this.price,
    required this.imageurl,
  });
  @override
  String toString() {
    return 'ProductDataModel(id: $id, name: $name)'; // Customize this based on your fields
  }
}
