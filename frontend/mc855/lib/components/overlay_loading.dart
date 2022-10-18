import 'package:flutter/material.dart';

class OverlayLoading extends StatelessWidget {
  const OverlayLoading({super.key});

  @override
  Widget build(BuildContext context) => Container(
      color: const Color.fromARGB(120, 0, 0, 0),
      child: const Center(child: CircularProgressIndicator()));
}
