import 'package:flutter/material.dart';

enum ScreenTemplateStyle {
  sheet,
  header,
}

class ScreenTemplateComponent extends StatelessWidget {
  final Widget? infoIcon;
  final String? infoTitle;
  final String? infoSubtitle;
  final Widget? layout;

  final Widget? actionItemLeft;
  final List<Widget>? actionListRight;

  final PreferredSizeWidget? navigatorTop;
  final Widget? navigatorLeft;
  final Widget? navigatorRight;
  final Widget? navigatorBottom;

  final ScreenTemplateStyle style;

  const ScreenTemplateComponent({
    Key? key,
    this.infoIcon,
    this.infoTitle,
    this.infoSubtitle,
    this.layout,
    this.actionItemLeft,
    this.actionListRight,
    this.navigatorTop,
    this.navigatorLeft,
    this.navigatorRight,
    this.navigatorBottom,
  }) :  style = ScreenTemplateStyle.header,
        super(key: key);

  const ScreenTemplateComponent.sheet({
    Key? key,
    this.infoIcon,
    this.infoTitle,
    this.infoSubtitle,
    this.layout,
    this.actionItemLeft,
    this.actionListRight,
    this.navigatorTop,
    this.navigatorLeft,
    this.navigatorRight,
    this.navigatorBottom,
  }) :  style = ScreenTemplateStyle.sheet,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final _ScreenTemplateModel model;

    switch(style) {
      case ScreenTemplateStyle.sheet:
        model = _ScreenTemplateModel(
          appBarForegroundColor: Theme.of(context).colorScheme.onSurface,
          appBarBackgroundColor: Colors.transparent,
          appBarElevationHeight: 0,
          enableOverlapAppBar: true,
        );
        break;
      case ScreenTemplateStyle.header:
        model = const _ScreenTemplateModel();
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: infoHeader(),
        foregroundColor: model.appBarForegroundColor,
        backgroundColor: model.appBarBackgroundColor,
        elevation: model.appBarElevationHeight,
        bottom: navigatorTop,
        leading: actionItemLeft,
        actions: actionListRight,
      ),
      body: layout,
      extendBodyBehindAppBar: model.enableOverlapAppBar,
      drawer: navigatorLeft,
      endDrawer: navigatorRight,
      bottomNavigationBar: navigatorBottom,
    );
  }

  Widget? infoHeader() {
    final infoWidgetList = <Widget> [];

    if (infoTitle?.isNotEmpty ?? false) {
      infoWidgetList.add(
        Text(
          infoTitle ?? '',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    if (infoSubtitle?.isNotEmpty ?? false) {
      infoWidgetList.add(
        Text(
          infoSubtitle ?? '',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
      );
    }

    final Widget? textWidget;

    if (infoWidgetList.isEmpty) {
      textWidget = null;
    } else if (infoWidgetList.length == 1) {
      textWidget = infoWidgetList.first;
    } else {
      textWidget = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: infoWidgetList,
      );
    }

    if (infoIcon == null) {
      return textWidget;
    } else if (textWidget == null) {
      return infoIcon;
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox.square(
            dimension: 24,
            child: infoIcon,
          ),
          const SizedBox(
            width: 12,
          ),
          textWidget,
        ],
      );
    }
  }
}

class _ScreenTemplateModel {
  final Color? appBarForegroundColor;
  final Color? appBarBackgroundColor;
  final double? appBarElevationHeight;
  final bool enableOverlapAppBar;

  const _ScreenTemplateModel({
    this.appBarForegroundColor,
    this.appBarBackgroundColor,
    this.appBarElevationHeight,
    this.enableOverlapAppBar = false,
  });
}