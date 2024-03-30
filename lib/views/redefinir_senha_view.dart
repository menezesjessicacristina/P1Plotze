import 'package:flutter/material.dart';
import 'package:meu_login/main.dart';
import 'package:meu_login/views/cadastro_view.dart';
import 'package:meu_login/views/login_view.dart';

class RedefinirSenhaView extends StatefulWidget {
  const RedefinirSenhaView({super.key});

  @override
  State<RedefinirSenhaView> createState() => _RedefinirSenhaViewState();
}

class _RedefinirSenhaViewState extends State<RedefinirSenhaView> {
  // Atributos
  //Chave identificadora do Form
  var formKey = GlobalKey<FormState>();

  //Controladores dos Campos de Texto
  var txtemail = TextEditingController();
  String msg =
      'Insira o seu email de usuário e enviaremos um link para você voltar a acessar a sua conta.';

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
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, border: Border.all(width: 3)),
                child: const Center(
                  child: Icon(
                    Icons.lock_outlined,
                    size: 90,
                  ),
                ),
              ),

              const SizedBox(height: 30),
              Text(
                'Problemas para entrar',
                style: TextStyle(color: Colors.blue[900], fontSize: 18),
              ),
              Text(
                msg,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              TextFormField(
                controller: txtemail,

                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                //
                // VALIDAÇÃO
                //
                validator: (value) {
                  if (value == null) {
                    return 'Campo Obrigatório';
                  } else if (value.isEmpty) {
                    return 'Campo Obrigatório';
                  }
                  if (value.contains('@')) {
                    return null;
                  } else {
                    return 'Informe um email valido';
                  }
                },
              ),

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
                  if (formKey.currentState!.validate()) {}
                },
                child: const Text('Enviar'),
              ),
              const SizedBox(height: 30),

              const Text(
                '--------- OU ---------',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 30),

              TextButton(
                child: Text('Criar outra conta',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CadastroView()),
                  );
                },
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
