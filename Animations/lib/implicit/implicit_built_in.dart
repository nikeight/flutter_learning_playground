import 'package:animations/implicit/built_in/implicit_built_in_home.dart';
import 'package:animations/implicit/implicit_modal.dart';
import 'package:flutter/material.dart';

class ImplicitBuiltInApiListScreen extends StatelessWidget {
  const ImplicitBuiltInApiListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Built In Implicit type animation'),
      ),
      body: ListView.builder(
        itemCount: ImplicitBuiltIn.values.length,
        itemBuilder: (context, index) {
          final item = ImplicitBuiltIn.values[index];
          return ListTile(
            title: Text(item.name),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      ImplicitBuiltInHomeScreen(animationType: item),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
