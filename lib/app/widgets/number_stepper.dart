import 'package:flutter/material.dart';
import 'package:register/app/widgets/base_indicator.dart';

class NumberStepper extends StatelessWidget {
  /// Each number defines a step. Hence, total count of numbers determines the total number of steps.
  final List<int>? numbers;

  /// The style applied to numbers except the `fontSize` which is calculated automatically.
  final TextStyle numberStyle;

  /// The color of the step when it is not reached.
  final Color? stepColor;

  /// The amount of padding inside a step.
  final double stepPadding;

  /// The color of a step when it is reached.
  final Color? activeStepColor;

  /// The border color of a step when it is reached.
  final Color? activeStepBorderColor;

  /// The border width of the active step.
  final double activeStepBorderWidth;

  /// The color of the line that separates the steps.
  final Color? lineColor;

  /// The length of the line that separates the steps.
  final double lineLength;

  /// The radius of a step.
  final double stepRadius;

  /// The animation effect to show when a step is reached.
  final Curve stepReachedAnimationEffect;

  /// The duration of the animation effect to show when a step is reached.
  final Duration stepReachedAnimationDuration;

  /// Whether the stepping is enabled or disabled.
  final bool steppingEnabled;

  /// Whether the scrolling is disabled or not.
  final bool scrollingDisabled;

  /// The currently active step.
  final int activeStep;

  /// Specifies the alignment of the NumberStepper.
  final AlignmentGeometry alignment;

  /// Creates a NumberStepper widget.
  NumberStepper({
    this.numbers,
    this.numberStyle = const TextStyle(color: Colors.black),
    this.stepColor,
    this.stepPadding = 0.0,
    this.activeStepColor,
    this.activeStepBorderColor,
    this.activeStepBorderWidth = 0.5,
    this.lineColor,
    this.lineLength = 50.0,
    this.stepRadius = 24.0,
    this.stepReachedAnimationEffect = Curves.bounceOut,
    this.stepReachedAnimationDuration = const Duration(seconds: 1),
    this.steppingEnabled = true,
    this.scrollingDisabled = false,
    this.activeStep = 0,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildSteps(),
    );
  }

  /// Builds the stepper steps.
  List<Widget> _buildSteps() {
    return List.generate(
      _numbersWrappedInText().length,
      (index) {
        return Row(
          children: <Widget>[
            _customizedIndicator(index),
            _customLine(index),
          ],
        );
      },
    );
  }

  Widget _customizedIndicator(int index) {
    return BaseIndicator(
      child: _numbersWrappedInText()[index],
      isSelected: index < activeStep,
      color: stepColor,
      activeColor: activeStepColor,
      activeBorderColor: activeStepBorderColor,
      radius: stepRadius,
      padding: stepPadding,
      activeBorderWidth: activeStepBorderWidth,
    );
  }

  Widget _customLine(int index) {
    return index < _numbersWrappedInText().length - 1
        ? Container(
            width: lineLength,
            height: 3.0,
            color: Colors.black,
          )
        : Container();
  }

  List<Widget> _numbersWrappedInText() {
    return List.generate(numbers!.length, (index) {
      return FittedBox(
        child: Text(
          '${numbers![index]}',
          style: numberStyle.copyWith(fontSize: stepRadius / 1.1),
        ),
      );
    });
  }
}
