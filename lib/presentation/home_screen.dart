import 'package:flutter/material.dart';
import 'package:save_me_app/presentation/help_screen.dart';

import '../shared/presentation/base_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () async => {
            await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HelpScreen()))
          },
          child: const Text('Help me!'),
        ),
      ],
    )));
  }
}
