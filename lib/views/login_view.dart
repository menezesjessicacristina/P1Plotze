import 'package:flutter/material.dart';
import 'package:meu_login/views/cadastro_view.dart';
import 'package:meu_login/views/redefinir_senha_view.dart';
import 'package:meu_login/views/sobre_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            child: Form(
              key: formKey,
              child: Column(children: [
                //Adicionar a imagem
                Image.asset(
                  'lib/imagem/carrinho3.gif',
                  width: 200,
                  height: 200,
                ),
                TextFormField(
                  controller: txtValor1,

                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
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
                SizedBox(height: 30),
                TextFormField(
                  obscureText: true,
                  controller: txtValor2,

                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
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
                    backgroundColor: Color.fromARGB(255, 141, 181, 226),
                    foregroundColor: Colors.blue.shade900,
                    minimumSize: Size(200, 50),
                    shadowColor: Color.fromARGB(255, 3, 17, 43),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  child: Text('Entrar'),
                ),
                SizedBox(height: 20),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RedefinirSenhaView()),
                    );
                  },
                  child: Text(
                    'Esqueci minha senha',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CadastroView()),
                    );
                  },
                  child: Text(
                    'Cadastre-se',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),

                SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SobreView()),
                        );
                      },
                      child: Text(
                        'Sobre',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
