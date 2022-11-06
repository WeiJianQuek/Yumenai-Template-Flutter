import 'package:flutter/material.dart';

import '../../component/button/dialog_button_component.dart';
import '../../component/template/dialog_template_component.dart';
import '../../utility/navigator_utility.dart';

class OptionDialogRoute {
  static Future<int?> select(final BuildContext context, {
    required final String? title,
    required final List<String?> itemTitleList,
    final String? message,
    final int? selectedIndexPosition,
  }) async {
    final itemWidgetList = <Widget> [];

    for (int i = 0; i < itemTitleList.length; i++) {
      itemWidgetList.add(
        RadioListTile(
          value: i,
          groupValue: selectedIndexPosition,
          title: Text(itemTitleList[i] ?? ''),
          onChanged: (_) {
            Navigator.pop(context, i);
          },
        ),
      );
    }

    final result = await NavigatorUtility.dialog.showPopup(
      context,
      widget: DialogTemplateComponent(
        title: title,
        message: message,
        layout: Column(
          mainAxisSize: MainAxisSize.min,
          children: itemWidgetList,
        ),
        layoutPadding: const EdgeInsets.only(
          top: 16,
        ),
        positiveButton: DialogButtonComponent.positive(
          title: 'Ok',
          onClicked: (context) {
            Navigator.pop(context);
          },
        ),
      ),
    );

    if (result is int) return result;

    return null;
  }

  const OptionDialogRoute._();
}