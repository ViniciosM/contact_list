import 'package:contact_list_app/dtos/person_dto.dart';
import 'package:contact_list_app/entities/person_entity.dart';
import 'package:contact_list_app/repositories/contact_list_repository.dart';

import './contact_list_service.dart';

class ContactListServiceImpl implements ContactListService {
  final ContactListRepository _contactListRepository;

  ContactListServiceImpl({required ContactListRepository contactListRepository})
      : _contactListRepository = contactListRepository;

  @override
  Future<void> addContact({required PersonDto personDto}) async {
    final PersonEntity personEntity = PersonEntity(
        name: personDto.name,
        phone: personDto.phone,
        email: personDto.email,
        photo: personDto.photo);

    await _contactListRepository.addContact(personEntity: personEntity);
  }

  @override
  Future<void> deleteContact({required String id}) async {
    await _contactListRepository.deleteContact(id: id);
  }

  @override
  Future<List<PersonDto>> getContacts() async {
    List<PersonDto> contactList = [];
    final contacts = await _contactListRepository.getContacts();
    if (contacts.isNotEmpty) {
      for (var personEntity in contacts) {
        contactList.add(PersonDto.fromEntity(personEntity));
      }
    }
    return contactList;
  }

  @override
  Future<void> updateContact({required PersonDto personDto}) async {
    final PersonEntity personEntity = PersonEntity(
        id: personDto.id,
        name: personDto.name,
        phone: personDto.phone,
        email: personDto.email,
        photo: personDto.photo);

    await _contactListRepository.updateContact(personEntity: personEntity);
  }
}
