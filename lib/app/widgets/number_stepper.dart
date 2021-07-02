import 'package:flutter/material.dart';

import 'base_stepper.dart';

class NumberStepper extends StatelessWidget {
  /// Each number defines a step. Hence, total count of numbers determines the total number of steps.
  final List<int>? numbers;

  /// Determines what should happen when a step is reached. This callback provides the __index__ of the step that was reached.
  final OnStepReached? onStepReached;

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
    this.onStepReached,
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
    return BaseStepper(
      children: _numbersWrappedInText(),
      onStepReached: onStepReached,
      stepColor: stepColor,
      activeStepColor: activeStepColor,
      activeStepBorderColor: activeStepBorderColor,
      activeStepBorderWidth: activeStepBorderWidth,
      lineColor: lineColor,
      lineLength: lineLength,
      stepRadius: stepRadius,
      stepReachedAnimationEffect: stepReachedAnimationEffect,
      stepReachedAnimationDuration: stepReachedAnimationDuration,
      steppingEnabled: steppingEnabled,
      padding: stepPadding,
      scrollingDisabled: scrollingDisabled,
      activeStep: activeStep,
      alignment: alignment,
    );
  }

  /// Wraps the integer numbers in Text widget. User style is also applied except the `fontSize` which is calculated automatically.
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