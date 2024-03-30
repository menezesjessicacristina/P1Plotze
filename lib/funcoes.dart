import 'package:flutter/material.dart';

class Funcoes {
  TextFormField campodeformulario(
    TextEditingController controle,
    String label,
    int opcao,
  ) {
    List<IconData> icone = [
      Icons.email_outlined,
      Icons.password_sharp,
      Icons.people_alt_outlined,
    ];
    return TextFormField(
        controller: controle,
        style: const TextStyle(fontSize: 18),
        decoration: InputDecoration(
          labelText: label,
          fillColor: Colors.white,
          filled: true,
          border: const OutlineInputBorder(),
          prefixIcon: Icon(icone[opcao]),
        ),
        // VALIDAÇÃO
        validator: (value) {
          if (value == null) {
            return 'Campo Obrigatório';
          } else if (value.isEmpty) {
            return 'Campo Obrigatório';
          }
          switch (opcao) {
            case 0:
              if (value.contains('@')) {
                return null;
              } else {
                return 'Informe um email valido';
              }
            case 1:
              if (double.tryParse(value) == null) {
                return 'Informe um valor Numerico';
              }
          }
          return null;
        });
  }
}
