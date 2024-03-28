import 'package:flutter/material.dart';
import 'package:meu_login/main.dart';

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

              TextFormField(
                controller: txtnome,
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.people_alt_outlined),
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Campo Obrigatório';
                  } else if (value.isEmpty) {
                    return 'Campo Obrigatório';
                  }
                  return null;
                },
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
              // CAMPO DE TEXTO
              //
              const SizedBox(height: 30),
              TextFormField(
                obscureText: true,
                controller: txtsenha,

                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.password_sharp),
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
                    return 'Apenas Numeros';
                    //Retornar null significa sucesso na validação
                  }
                  return null;
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
                child: const Text('Cadastrar'),
              ),

              const SizedBox(height: 80),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PrincipalView()),
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
