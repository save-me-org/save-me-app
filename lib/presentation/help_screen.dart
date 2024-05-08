import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:save_me_app/shared/presentation/where_screen.dart';
import 'package:save_me_app/providers/people.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => PeopleProvider()),
    ], child: const WhereScreen());
  }
}
