// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu App',
      home: PrincipalView(),
    );
  }
}

class PrincipalView extends StatefulWidget {
  const PrincipalView({super.key});

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  //
  // Atributos
  //

  //Chave identificadora do Form
  var formKey = GlobalKey<FormState>();

  //Controladores dos Campos de Texto
  var txtValor1 = TextEditingController();
  var txtValor2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 253, 238, 99),
        body: Padding(
          padding: EdgeInsets.fromLTRB(50, 100, 50, 100),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //
                //Adicionar a imagem
                //

                Stack(
                    clipBehavior: Clip.none,
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Positioned(
                        bottom: 38,
                        child: Image.asset(
                          'lib/imagem/dog.png',
                          width: 200,
                          height: 200,
                        ),
                      ),
                      TextFormField(
                        controller: txtValor1,

                        style: TextStyle(fontSize: 32),
                        decoration: InputDecoration(
                          labelText: 'Valor 1',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.pets_outlined),
                        ),
                        //
                        // VALIDAÇÃO
                        //
                        validator: (value) {
                          if (value == null) {
                            return 'Informe um valor';
                          } else if (value.isEmpty) {
                            return 'Informe um valor';
                          } else if (double.tryParse(value) == null) {
                            return 'Informe um valor Numerico';
                            //Retornar null significa sucesso na validação
                          }
                          return null;
                        },
                      ),
                    ]),
                //SizedBox(height: 30),

                //
                // CAMPO DE TEXTO
                //

                SizedBox(height: 30),
                TextFormField(
                  controller: txtValor2,

                  style: TextStyle(fontSize: 32),
                  decoration: InputDecoration(
                    labelText: 'Valor 2',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.pets_outlined),
                  ),
                  //
                  // VALIDAÇÃO
                  //
                  validator: (value) {
                    if (value == null) {
                      return 'Informe um valor';
                    } else if (value.isEmpty) {
                      return 'Informe um valor';
                    } else if (double.tryParse(value) == null) {
                      return 'Informe um valor Numerico';
                      //Retornar null significa sucesso na validação
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                //
                // BOTÃO
                //
                //ElevatedButton, OutlinedButton, TextButton
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 187, 240, 251),
                    foregroundColor: Colors.blue.shade900,
                    minimumSize: Size(200, 50),
                    shadowColor: Color.fromARGB(255, 3, 17, 43),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      //
                      //Retornar as informaçoesninseridas
                      //nos campos de texto
                      setState(() {
                        double v1 = double.parse(txtValor1.text);
                        double v2 = double.parse(txtValor2.text);
                        double s = (v1 + v2);

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Soma: ${s.toStringAsFixed(2)}"),
                            duration: Duration(seconds: 3)));
                      });
                    }
                  },
                  child: Text('OK'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
