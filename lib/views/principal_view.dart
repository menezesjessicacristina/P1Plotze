import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PrincipalView extends StatefulWidget {
  const PrincipalView({super.key});

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Lista de Compras'),
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 253, 238, 99),
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Color.fromARGB(255, 255, 252, 219),
              shadowColor: Colors.amber,
              surfaceTintColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  title: Text('Mercado'),
                ),
              ),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Text('Nova Lista'),
          icon: Icon(Icons.add),
          backgroundColor: const Color.fromARGB(255, 253, 238, 99),
        ),
      ),
    );
  }
}
