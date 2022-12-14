import 'package:flutter/material.dart';

import '../../component/button/dialog_button_component.dart';

class DialogTemplateComponent extends StatelessWidget {
  final String? title;
  final Color? titleColor;
  final String? message;
  final Color? messageColor;
  final Widget? layout;
  final EdgeInsets? layoutPadding;
  final DialogButtonComponent? positiveButton;
  final DialogButtonComponent? negativeButton;

  const DialogTemplateComponent({
    Key? key,
    required this.title,
    this.titleColor,
    this.message,
    this.messageColor,
    this.layout,
    this.layoutPadding,
    this.positiveButton,
    this.negativeButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      title: Text(
        title ?? '',
        style: TextStyle(
          color: titleColor,
        ),
      ),
      content: _messageLayout,
      contentPadding: layoutPadding,
      scrollable: true,
      actionsPadding: const EdgeInsets.symmetric(
        horizontal: 6.0,
      ),
      actions: [
        if (negativeButton is Widget) negativeButton ?? const SizedBox(),
        if (positiveButton is Widget) positiveButton ?? const SizedBox(),
      ],
    );
  }

  Widget? get _messageLayout {
    final widgetList = <Widget> [];

    if (message?.isNotEmpty ?? false) {
      widgetList.add(
        Text(
          message ?? '',
          style: TextStyle(
            color: messageColor,
          ),
        ),
      );
    }

    if (layout is Widget) {
      if (widgetList.isNotEmpty) {
        widgetList.add(
          const SizedBox(
            height: 12.0,
          ),
        );
      }
      widgetList.add(layout ?? const SizedBox());
    }

    if (widgetList.isEmpty) {
      return null;
    } else if (widgetList.length > 2) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: widgetList,
      );
    } else {
      return widgetList.first;
    }
  }
}
