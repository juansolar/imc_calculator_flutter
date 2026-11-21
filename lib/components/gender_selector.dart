import 'package:flutter/widgets.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';
import 'package:material_ui/material_ui.dart';

class GenderSelector extends StatefulWidget {
  const new({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: (){
              setState(() {
                selectedGender = "male";
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: selectedGender == 'male' ? AppColors.backgroundComponentSelected : AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(children: [
                    Image.asset("assets/images/male.png", height: 100,),
                    SizedBox(height: 8,),
                    Text("Male".toUpperCase(), style: TextStyles.bodyText,)
                        ],),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: (){
              setState(() {
                selectedGender = 'female';
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8, top: 16, bottom: 16, right: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: selectedGender == 'female' ? AppColors.backgroundComponentSelected : AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(children: [
                    Image.asset("assets/images/female.png", height: 100,),
                    SizedBox(height: 8,),
                    Text("Female".toUpperCase(), style: TextStyles.bodyText,)
                  ]),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
