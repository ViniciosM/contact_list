class PersonEntity {
  final String? id;
  final String name;
  final String? photo;
  final String phone;
  final String? email;

  PersonEntity({
    this.id,
    required this.name,
    this.photo,
    required this.phone,
    this.email,
  });
}
