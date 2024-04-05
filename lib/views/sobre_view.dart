import 'package:flutter/material.dart';

class SobreView extends StatefulWidget {
  const SobreView({super.key});

  @override
  State<SobreView> createState() => _SobreViewState();
}

class _SobreViewState extends State<SobreView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sobre'),
          backgroundColor: const Color.fromARGB(255, 253, 238, 99),
        ),
        body: Container(
          color: Colors.black87,
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 4,
                  vertical: 40),
              child: Image.asset(
                'lib/imagem/gifapp_compras.gif',
                fit: BoxFit.fill,
                width: 200,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Text(
                  'Lista de Compras: Este é um aplicativo simples e intuitivo para criar e gerenciar listas de compras. Você pode criar listas personalizadas para diferentes finalidades, como compras semanais, material escolar, lista de presentes e muito mais. \n\nO objetivo deste aplicativo é ajudar no seu dia a dia a otimizar o tempo e não deixar-lo esquecer nenhum item da sau lista. ',
                  style: TextStyle(color: Colors.yellow[50]),
                  textAlign: TextAlign.justify),
            ),
            
            Padding(
              padding:
                  const EdgeInsets.only(left: 80, top: 100),
              child: Text('Por: Jéssica Cristina Menezes',
                  style: TextStyle(color: Colors.yellow[50]),
                  ),
            )
          ]),
        ),
      ),
    );
  }
}
