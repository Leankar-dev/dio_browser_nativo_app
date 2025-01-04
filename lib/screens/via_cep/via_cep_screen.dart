import 'package:dio_browser_nativo_app/screens/via_cep/via_cep_controller.dart';
import 'package:flutter/material.dart';

class ViaCepScreen extends StatefulWidget {
  const ViaCepScreen({super.key});

  @override
  State<ViaCepScreen> createState() => _ViaCepScreenState();
}

class _ViaCepScreenState extends State<ViaCepScreen> {
  final cepEC = TextEditingController();
  final viaCepController = ViaCepController();

  @override
  void dispose() {
    super.dispose();
    cepEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'Buscar Logradouro por CEP',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: cepEC,
              decoration: const InputDecoration(
                  labelText: 'CEP',
                  hintText: 'Digite o CEP',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                viaCepController.getAddress(cepEC.text);
                print(cepEC.text);
              },
              child: const Text('Buscar Logradouro'),
            ),
            const SizedBox(
              height: 16,
            ),
            ValueListenableBuilder(
              valueListenable: viaCepController,
              builder: (_, viaCepControllerValue, child) {
                return Text(
                  'Logradouro: ${viaCepControllerValue.street}',
                  style: TextStyle(fontSize: 20),
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
            ValueListenableBuilder(
                valueListenable: viaCepController,
                builder: (_, viaCepControllerValue, child) {
                  return Text(
                    'Cidade: ${viaCepControllerValue.city}',
                    style: TextStyle(fontSize: 20),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
