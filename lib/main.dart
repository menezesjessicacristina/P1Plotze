// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:meu_login/views/cadastro_view.dart';
import 'package:meu_login/views/login_view.dart';
import 'package:meu_login/views/redefinir_senha_view.dart';
import 'package:meu_login/views/sobre_view.dart';

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
      home: LoginView(),
    );
  }
}

class PrincipalView extends StatefulWidget {
  const PrincipalView({super.key});

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
