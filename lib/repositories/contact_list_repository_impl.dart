import 'dart:developer';

import 'package:contact_list_app/constants/api.dart';
import 'package:contact_list_app/dtos/person_dto.dart';
import 'package:contact_list_app/entities/person_entity.dart';
import 'package:dio/dio.dart';

import './contact_list_repository.dart';

class ContactListRepositoryImpl implements ContactListRepository {
  final Dio _dio;

  ContactListRepositoryImpl({required Dio dio}) : _dio = dio;

  @override
  Future<void> addContact({required PersonEntity personEntity}) async {
    PersonDto personDto = PersonDto.fromEntity(personEntity);
    try {
      _dio.options.headers = {
        "X-Parse-Application-Id": "3QCuU1tQE2Io4J91wmPrhAeKGLCE6mKB8edmM9Wk",
        "X-Parse-REST-API-Key": "z3iChTH5BHJvNqPMLN4xkYXQBIwehZ7pnhfrFErc",
        "Content-Type": "application/json",
      };

      await _dio.post(Api.baseURL(), data: {
        "name": personDto.name,
        "phone": personDto.phone,
        "email": personDto.email,
        "photo": personDto.photo,
      });
    } catch (e, s) {
      log('Failed to add contact. ERROR: $e STACKTRACE: $s');
      throw 'Erro ao adicionar contato';
    }
  }

  @override
  Future<void> deleteContact({required String id}) async {
    try {
      _dio.options.headers = {
        "X-Parse-Application-Id": "3QCuU1tQE2Io4J91wmPrhAeKGLCE6mKB8edmM9Wk",
        "X-Parse-REST-API-Key": "z3iChTH5BHJvNqPMLN4xkYXQBIwehZ7pnhfrFErc",
      };

      await _dio.delete('${Api.baseURL()}/$id');
    } catch (e, s) {
      log('Failed to delete contact. ERROR: $e STACKTRACE: $s');
      throw 'Erro ao excluir contato';
    }
  }

  @override
  Future<List<PersonEntity>> getContacts() async {
    List<PersonEntity> contacts = [];
    try {
      _dio.options.headers = {
        "X-Parse-Application-Id": "3QCuU1tQE2Io4J91wmPrhAeKGLCE6mKB8edmM9Wk",
        "X-Parse-REST-API-Key": "z3iChTH5BHJvNqPMLN4xkYXQBIwehZ7pnhfrFErc",
      };

      final result = await _dio.get(Api.baseURL());
      if (result.statusCode == 200) {
        // Converter objetos
        contacts = result.data(PersonDto.fromJson(result.data));
      }

      return contacts;
    } catch (e, s) {
      log('Failed to get contacts. ERROR: $e STACKTRACE: $s');
      throw 'Erro ao buscar contatos';
    }
  }

  @override
  Future<void> updateContact({required PersonEntity personEntity}) async {
    PersonDto personDto = PersonDto.fromEntity(personEntity);
    try {
      _dio.options.headers = {
        "X-Parse-Application-Id": "3QCuU1tQE2Io4J91wmPrhAeKGLCE6mKB8edmM9Wk",
        "X-Parse-REST-API-Key": "z3iChTH5BHJvNqPMLN4xkYXQBIwehZ7pnhfrFErc",
        "Content-Type": "application/json",
      };

      await _dio.put('${Api.baseURL()}/${personEntity.id}', data: {
        "name": personDto.name,
        "phone": personDto.phone,
        "email": personDto.email,
        "photo": personDto.photo,
      });
    } catch (e, s) {
      log('Failed to update contact. ERROR: $e STACKTRACE: $s');
      throw 'Erro ao atualizar contato';
    }
  }
}
