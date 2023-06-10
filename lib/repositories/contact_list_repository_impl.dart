import 'package:contact_list_app/entities/person_entity.dart';
import 'package:dio/dio.dart';

import './contact_list_repository.dart';

class ContactListRepositoryImpl implements ContactListRepository {
  final Dio _dio;

  ContactListRepositoryImpl({required Dio dio}) : _dio = dio;

  @override
  Future<void> addContact({required PersonEntity personEntity}) async {}

  @override
  Future<void> deleteContact({required String id}) {
    // TODO: implement deleteContact
    throw UnimplementedError();
  }

  @override
  Future<List<PersonEntity>> getContacts() {
    // TODO: implement getContacts
    throw UnimplementedError();
  }

  @override
  Future<void> updateContact({required PersonEntity personEntity}) {
    // TODO: implement updateContact
    throw UnimplementedError();
  }
}
