import 'package:flutter/material.dart';
import 'package:meu_login/funcoes.dart';
import 'package:meu_login/views/login_view.dart';

class CadastroView extends StatefulWidget {
  const CadastroView({super.key});

  @override
  State<CadastroView> createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
  // Atributos
  //Chave identificadora do Form
  var formKey = GlobalKey<FormState>();

  //Controladores dos Campos de Texto
  var txtnome = TextEditingController();
  var txtemail = TextEditingController();
  var txtsenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 253, 238, 99),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          child: Form(
            key: formKey,
            child: Column(children: [
              const SizedBox(height: 30),
              const Icon(
                Icons.people,
                size: 90,
                color: Color.fromARGB(255, 5, 62, 128),
              ),
              Text(
                'Cadastro',
                style: TextStyle(color: Colors.blue[900], fontSize: 36),
              ),
              const SizedBox(height: 30),

              Funcoes().campodeformulario(txtnome, 'Nome', 2),
              const SizedBox(height: 30),

              Funcoes().campodeformulario(txtemail, 'Email', 0),
              // CAMPO DE TEXTO
              //
              const SizedBox(height: 30),
              Funcoes().campodeformulario(txtsenha, 'Senha', 1),
              const SizedBox(height: 30),
              //
              // BOTÃO
              //
              //ElevatedButton, OutlinedButton, TextButton
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 141, 181, 226),
                  foregroundColor: Colors.blue.shade900,
                  minimumSize: const Size(200, 50),
                  shadowColor: const Color.fromARGB(255, 3, 17, 43),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginView()),
                    );
                  }
                },
                child: const Text('Cadastrar'),
              ),

              const SizedBox(height: 80),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginView()),
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.undo, color: Color.fromARGB(255, 5, 62, 128)),
                    Text(
                      'Voltar',
                      style: TextStyle(
                          color: Color.fromARGB(255, 5, 62, 128), fontSize: 18),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
