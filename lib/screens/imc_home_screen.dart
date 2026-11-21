import 'package:flutter/widgets.dart';
import 'package:imc_calculator/components/gender_selector.dart';

class ImcHomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector()
      ],
    );
  }
}