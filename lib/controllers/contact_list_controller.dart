import 'package:contact_list_app/dtos/person_dto.dart';
import 'package:contact_list_app/services/contact_list_service.dart';
import 'package:flutter/material.dart';

class ContactListController extends ChangeNotifier {
  final ContactListService _contactListService;

  ContactListController({required ContactListService contactListService})
      : _contactListService = contactListService;

  Future<void> addContact({required PersonDto personDto}) async {
    await _contactListService.addContact(personDto: personDto);
    notifyListeners();
  }
}
