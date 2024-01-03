import 'package:flutter/material.dart';

class ScreenConformation extends StatefulWidget {
  const ScreenConformation({required this.address, required this.totals,super.key});
  final address;
  final totals;

  @override
  State<ScreenConformation> createState() => _ScreenConformationState();
}

class _ScreenConformationState extends State<ScreenConformation> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}