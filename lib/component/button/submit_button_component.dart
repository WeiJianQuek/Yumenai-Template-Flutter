import 'package:flutter/material.dart';

const _minimumSize = Size(150, 45);
const _roundedShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(12.0),
  ),
);
const _textStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
);

enum SubmitButtonStyle {
  primary,
  secondary,
}

class SubmitButtonComponent extends StatelessWidget {
  final String? title;
  final void Function() onClicked;
  final SubmitButtonStyle mode;

  const SubmitButtonComponent({
    Key? key,
    required this.title,
    required this.onClicked,
  }) :  mode = SubmitButtonStyle.primary,
        super(key: key);

  const SubmitButtonComponent.secondary({
    Key? key,
    required this.title,
    required this.onClicked,
  }) :  mode = SubmitButtonStyle.secondary,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    switch(mode) {
      case SubmitButtonStyle.primary:
        return ElevatedButton(
          onPressed: onClicked,
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            minimumSize: _minimumSize,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            shape: _roundedShape,
            textStyle: _textStyle,
          ),
          child: Text(title ?? ''),
        );
      case SubmitButtonStyle.secondary:
        return OutlinedButton(
          onPressed: onClicked,
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1.5,
            ),
            minimumSize: _minimumSize,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            shape: _roundedShape,
            textStyle: _textStyle,
          ),
          child: Text(title ?? ''),
        );
    }
  }
}
