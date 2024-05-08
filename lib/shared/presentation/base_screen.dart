import 'package:flutter/material.dart';

class BaseScreen<T> extends StatelessWidget {
  const BaseScreen({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Save Me"),
      ),
      body: body,
    );
  }
}
