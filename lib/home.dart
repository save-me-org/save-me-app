import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title, required this.helpMeBtnLabel, required this.reportFoundBtnLabel, required this.findSomebodyBtnLabel});

  final String title;
  final String helpMeBtnLabel;
  final String reportFoundBtnLabel;
  final String findSomebodyBtnLabel;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text(widget.helpMeBtnLabel),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(widget.reportFoundBtnLabel),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(widget.findSomebodyBtnLabel),
          ),
        ],
      )),
    );
  }
}
