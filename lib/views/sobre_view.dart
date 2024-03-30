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
                  'Lista de Compras: Este aplicativo oferece uma experiência completa, Lembre-se de escolher um aplicativo que atenda às suas necessidades e preferências pessoais. Feliz compras! ',
                  style: TextStyle(color: Colors.yellow[50]),
                  textAlign: TextAlign.center),
            )
          ]),
        ),
      ),
    );
  }
}
