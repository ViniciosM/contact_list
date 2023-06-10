import 'package:contact_list_app/entities/person_entity.dart';

abstract interface class ContactListRepository {
  Future<List<PersonEntity>> getContacts();
  Future<void> addContact({required PersonEntity personEntity});
  Future<void> deleteContact({required String id});
  Future<void> updateContact({required PersonEntity personEntity});
}
