import 'package:contact_list_app/dtos/person_dto.dart';

abstract interface class ContactListService {
  Future<List<PersonDto>> getContacts();
  Future<void> addContact({required PersonDto personDto});
  Future<void> deleteContact({required String id});
  Future<void> updateContact({required PersonDto personDto});
}
