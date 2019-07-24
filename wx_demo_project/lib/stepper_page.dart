import 'package:flutter/material.dart';

import 'custom_stepper.dart';

class StepperPage extends StatefulWidget {
  @override
  _StepperPageState createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('StepperPage'),
        ),
        body: Center(
          child: CustomStepper(
            currentStep: 2,
            type: CustomStepperType.horizontal,
            steps: ['one', 'two', 'three', 'four']
                .map(
                  (s) => CustomStep(title: Text(s), content: Container()),
                )
                .toList(),
            controlsBuilder: (BuildContext context,
                {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
              return Container();
            },
          ),
        ));
  }
}
