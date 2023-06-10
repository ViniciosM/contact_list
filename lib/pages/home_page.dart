import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const CircleAvatar(
                radius: 15,
                child: Icon(Icons.person),
              ),
              title: Text('Name Person $index'),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete_outline,
                    color: Colors.redAccent,
                  )),
            );
          }),
      floatingActionButton:
          IconButton(onPressed: () {}, icon: const Icon(Icons.add_outlined)),
    );
  }
}
