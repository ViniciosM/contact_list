part of 'person_dto.dart';

mixin class PersonValidate {
  void nameValidate(String name) {
    if (name.isEmpty) {
      throw 'O nome é obrigatório'.asException();
    }
  }

  void phoneValidate(String phone) {
    if (phone.isEmpty) {
      throw 'O telefone é obrigatório'.asException();
    }
  }

  void emailValidate(String email) {
    if (email.isEmpty) {
      throw 'Email é obrigatório'.asException();
    }

    final regexp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!regexp.hasMatch(email)) {
      throw 'Email inválido'.asException();
    }
  }
}
