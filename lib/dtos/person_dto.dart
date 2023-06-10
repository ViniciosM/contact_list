import 'package:contact_list_app/dtos/dto.dart';
import 'package:contact_list_app/entities/person_entity.dart';
import 'package:contact_list_app/exceptions/validate_exception.dart';

import '../services/string_generator.dart';

part 'person_validate_mixin.dart';

class PersonDto extends DTO with PersonValidate {
  late String id;
  final String name;
  final String? photo;
  final String phone;
  final String email;

  PersonDto({
    String? id,
    required this.name,
    this.photo,
    required this.phone,
    required this.email,
  }) {
    this.id = id ?? stringGenerator();
  }

  PersonDto copyWith({
    String? id,
    String? name,
    String? photo,
    String? phone,
    String? email,
  }) =>
      PersonDto(
        id: id ?? this.id,
        name: name ?? this.name,
        photo: photo ?? this.photo,
        phone: phone ?? this.phone,
        email: email ?? this.email,
      );

  factory PersonDto.fromJson(Map<String, dynamic> json) => PersonDto(
        id: json["id"],
        name: json["name"],
        photo: json["photo"],
        phone: json["phone"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "photo": photo,
        "phone": phone,
        "email": email,
      };

  factory PersonDto.fromEntity(PersonEntity personEntity) {
    return PersonDto(
        name: personEntity.name,
        phone: personEntity.phone,
        email: personEntity.email ?? '',
        photo: personEntity.photo);
  }

  @override
  void validate() {
    nameValidate(name);
    phoneValidate(phone);
    emailValidate(email);
  }
}
