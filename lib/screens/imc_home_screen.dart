import 'package:flutter/widgets.dart';
import 'package:imc_calculator/components/gender_selector.dart';
import 'package:imc_calculator/components/height_selector.dart';
import 'package:imc_calculator/components/number_selector.dart';

class ImcHomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {

  int selectedAge = 30;
  int selectedWeight = 75;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(),
        HeightSelector(),
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
      ],
    );
  }
}
