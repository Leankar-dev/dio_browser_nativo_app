import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_browser_nativo_app/rest_client/dio_rest_client.dart';

class ViaCepRepository {
  Future<({String city, String street})> getAddress(String cep) async {
    try {
      final restClient = DioRestClient();

      final Response(:data) = await restClient.get('/$cep/json');

      return (
        city: data['localidade'] as String,
        street: data['logradouro'] as String,
      );
    } on DioException catch (e, s) {
      log('Erro ao buscar CEP $cep', error: e, stackTrace: s);
      throw (
        city: 'Não encontrado',
        street: 'Não encontrado',
      );
    }
  }
}
