import 'package:flutter/material.dart';

class VisitSummeries extends StatelessWidget {
  const VisitSummeries({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visit Summaries'),
      ),
      body: const Center(
        child: Text('Visit Summaries Content'),
      ),
    );
  }
}