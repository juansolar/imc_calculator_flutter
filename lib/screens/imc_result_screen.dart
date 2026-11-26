import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/button_styles.dart';
import 'package:imc_calculator/core/text_styles.dart';

class ImcResultScreen extends StatelessWidget {
  final int height;
  final int weight;

  const ImcResultScreen({
    super.key,
    required this.height,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: toolbarResult(),
      body: bodyResult(context),
    );
  }

  Padding bodyResult(BuildContext context) {

    double fixedHeight = height /100;
    double imcResult = weight/( fixedHeight * fixedHeight );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Tu resultado", style: TextStyle(
            fontSize: 38,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only( top: 32, bottom: 32),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(getTitleByImc(imcResult), style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: getColorByImc(imcResult)),),
                    Text(
                      imcResult.toStringAsFixed(2), 
                      style: TextStyle(fontSize: 76, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(getDescriptionByImc(imcResult), 
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white), textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              }, 
              style: ButtonStyles.primaryButton,
              child: Text("Terminate", style: TextStyles.bodyText,),
            ),
          )
        ],
      ),
    );
  }

  AppBar toolbarResult() => AppBar(title: Text("Result"), backgroundColor: AppColors.appBar, foregroundColor: AppColors.primary,);

  Color getColorByImc(double imcResult) {
    return switch(imcResult){
      < 18.5 => Colors.blue, // underweight
      < 24.0 => Colors.green, // normal
      < 29.99 => Colors.orange, // overweight
      _ => Colors.red // obesity
    };
  }

  String getTitleByImc(double imcResult){
    return switch(imcResult){
      < 18.5 => "Underweight", // underweight
      < 24.0 => "Normal", // normal
      < 29.99 => "Overweight", // overweight
      _ => "Obesity" // obesity
    };
  }

  String getDescriptionByImc(double imcResult){
    return switch(imcResult){
      < 18.5 => "Your BMI is below the normal range. Consider eating a balanced diet to help reach a healthy weight.", // underweight
      < 24.0 => "Your BMI is within the normal range. Keep maintaining a balanced diet and an active lifestyle.", // normal
      < 29.99 => "Your BMI is above the normal range. Consider regular physical activity and a balanced diet to help manage your weight.", // overweight
      _ => "Your BMI is above the recommended range. Consider consulting a healthcare professional for guidance on managing your weight." // obesity
    };
  }
}
