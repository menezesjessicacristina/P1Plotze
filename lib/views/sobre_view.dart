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
        ),
        body: Column(
          children: [
            Image.asset('lib/asset/imagem/gifapp_compras.gif'),
          ],
        ),
      ),
    );
  }
}
