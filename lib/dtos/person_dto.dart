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
