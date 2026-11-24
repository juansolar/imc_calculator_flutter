import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:imc_calculator/components/gender_selector.dart';
import 'package:imc_calculator/components/height_selector.dart';
import 'package:imc_calculator/components/number_selector.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class ImcHomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {

  String? selectedGender;
  int selectedAge = 30;
  int selectedWeight = 75;
  int selectedHeight = 170;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(gender: selectedGender,onGenderChanged: (value){
          setState(() {
            selectedGender = value;
          });
        },),
        HeightSelector(
          height: selectedHeight,
          onHeightChanged: (value){
            setState(() {
              selectedHeight = value.toInt();
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(child: NumberSelector(
                  title: "AGE",
                  value: selectedAge,
                  onIncrement: (){
                    setState(() {
                      selectedAge++;
                    });
                  },
                  onDecrement: (){
                    setState(() {
                      selectedAge--;
                    });
                  },
                )
              ),
              SizedBox(width: 16,),
              Expanded(child: NumberSelector(
                  title: "WEIGHT",
                  value: selectedWeight,
                  onIncrement: (){
                    setState(() {
                      selectedWeight++;
                    });
                  },
                  onDecrement: (){
                    setState(() {
                      selectedWeight--;
                    });
                  },
                )
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: (){
                  print("El genero es $selectedGender, la altura es $selectedHeight, la edad es $selectedAge, el peso es $selectedWeight");
                }, 
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  )),
                  backgroundColor: WidgetStatePropertyAll(AppColors.secundary),
                ),
                child: Text("Calculate", style: TextStyles.bodyText,))),
        )
      ],
    );
  }
}
