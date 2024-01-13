import 'package:animations/explicit/built_in/explicit_built_in_home.dart';
import 'package:animations/explicit/explicit_modal.dart';
import 'package:flutter/material.dart';

class ExplicitBuiltInApiListScreen extends StatelessWidget {
  const ExplicitBuiltInApiListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Built In Implicit type animation'),
      ),
      body: ListView.builder(
        itemCount: ExplicitBuiltIn.values.length,
        itemBuilder: (context, index) {
          final item = ExplicitBuiltIn.values[index];
          return ListTile(
            title: Text(item.name),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      ExplicitBuiltInHomeScreen(animationType: item),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
