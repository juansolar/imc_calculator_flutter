import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class HeightSelector extends StatefulWidget {
  const new({super.key});

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {

  double height = 170;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.only(right: 16, left: 16, bottom: 16),
      child: Material(
        color: AppColors.backgroundComponent,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          children: [
            Text("Height", style: TextStyles.bodyText),
            Text("${height.toStringAsFixed(0)} cm", style: TextStyles.subtitle),
            Slider(value: height, onChanged: (value){ 
              setState(() {
                height = value;
              });
            },min: 150,
            max: 210, divisions: 60,
            activeColor: AppColors.secundary,
            )
          ],
        ),
      ),
    );
  }
}