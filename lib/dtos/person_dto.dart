import 'package:contact_list_app/dtos/dto.dart';
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

  @override
  void validate() {
    nameValidate(name);
    phoneValidate(phone);
    emailValidate(email);
  }
}
