import 'package:flutter/widgets.dart';
import 'package:imc_calculator/core/text_styles.dart';

class ImcResultScreen extends StatelessWidget {

  final int height;
  final int weight;

  const ImcResultScreen({super.key, required this.height, required this.weight});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(height.toString(), style: TextStyles.bodyText,),
        Text(weight.toString(), style: TextStyles.bodyText,)
      ],
    );
  }
}