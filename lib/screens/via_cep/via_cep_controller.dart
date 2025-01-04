import 'package:dio_browser_nativo_app/repositories/via_cep_repository.dart';
import 'package:flutter/material.dart';

class ViaCepController extends ValueNotifier<({String city, String street})> {
  ViaCepController() : super((city: '', street: ''));

  final repository = ViaCepRepository();

  Future<void> getAddress(String cep) async {
    try {
      final data = await repository.getAddress(cep);
      value = data;
    } catch (e) {
      value = (city: 'Não encontrado', street: 'Não encontrado');
    }
  }
}
