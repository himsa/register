import 'package:flutter/material.dart';

import 'base_indicator.dart';

/// Callback is fired when a step is reached.
typedef OnStepReached = void Function(int index);

class BaseStepper extends StatefulWidget {
  /// Each child defines a step. Hence, total number of children determines the total number of steps.
  final List<Widget>? children;

  /// This callback provides the __index__ of the step that is reached.
  final OnStepReached? onStepReached;

  /// The color of the step when it is not reached.
  final Color? stepColor;

  /// The color of a step when it is reached.
  final Color? activeStepColor;

  /// The border color of a step when it is reached.
  final Color? activeStepBorderColor;

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

  /// Amount of padding on each side of the child widget.
  final double padding;

  /// The width of the active step border.
  final double activeStepBorderWidth;

  /// Whether to disable scrolling or not.
  final scrollingDisabled;

  /// The step that is currently active.
  final int activeStep;

  /// Specifies the alignment of the stepper.
  final AlignmentGeometry? alignment;

  /// Creates a basic stepper.
  BaseStepper({
    this.children,
    this.onStepReached,
    this.stepColor,
    this.activeStepColor,
    this.activeStepBorderColor,
    this.lineColor,
    this.lineLength = 50.0,
    this.stepRadius = 24.0,
    this.stepReachedAnimationEffect = Curves.bounceOut,
    this.stepReachedAnimationDuration = const Duration(seconds: 1),
    this.steppingEnabled = true,
    this.padding = 5.0,
    this.activeStepBorderWidth = 0.5,
    this.scrollingDisabled = false,
    this.activeStep = 0,
    this.alignment,
  }) {
    assert(
      stepRadius > 0,
      'iconIndicatorRadius must be greater than 0',
    );

    assert(
      activeStep >= 0 && activeStep <= children!.length,
      'Error: Active Step out of range',
    );
  }

  @override
  _BaseStepperState createState() => _BaseStepperState();
}

class _BaseStepperState extends State<BaseStepper> {
  ScrollController? _scrollController;
  late int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = widget.activeStep;
    this._scrollController = ScrollController();
    super.initState();
  }

  @override
  void didUpdateWidget(BaseStepper oldWidget) {
    // Verify that the active step falls within a valid range.
    if (widget.activeStep >= 0 && widget.activeStep < widget.children!.length) {
      _selectedIndex = widget.activeStep;
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  /// Controls the step scrolling.
  void _afterLayout(_) {
    // ! Provide detailed explanation.
    for (int i = 0; i < widget.children!.length; i++) {
      _scrollController!.animateTo(
        i * ((widget.stepRadius * 2) + widget.lineLength),
        duration: widget.stepReachedAnimationDuration,
        curve: widget.stepReachedAnimationEffect,
      );

      if (_selectedIndex == i) break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Controls scrolling behavior.
    if (!widget.scrollingDisabled)
      WidgetsBinding.instance!.addPostFrameCallback(_afterLayout);

    return _stepperBuilder();
  }

  /// Builds the stepper.
  Widget _stepperBuilder() {
    return Align(
      alignment: widget.alignment ?? Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        physics: widget.scrollingDisabled
            ? NeverScrollableScrollPhysics()
            : ClampingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          padding: const EdgeInsets.all(8.0),
          child: Row(children: _buildSteps()),
        ),
      ),
    );
  }

  /// Builds the stepper steps.
  List<Widget> _buildSteps() {
    return List.generate(
      widget.children!.length,
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
      child: widget.children![index],
      isSelected: index < _selectedIndex,
      onPressed: () {
        if (widget.steppingEnabled) {
          setState(() {
            _selectedIndex = index;

            if (widget.onStepReached != null) {
              widget.onStepReached!(_selectedIndex);
            }
          });
        }
      },
      color: widget.stepColor,
      activeColor: widget.activeStepColor,
      activeBorderColor: widget.activeStepBorderColor,
      radius: widget.stepRadius,
      padding: widget.padding,
      activeBorderWidth: widget.activeStepBorderWidth,
    );
  }

  Widget _customLine(int index) {
    return index < widget.children!.length - 1
        ? Container(
            width: widget.lineLength,
            height: 3.0,
            color: Colors.black,
          )
        : Container();
  }
}
