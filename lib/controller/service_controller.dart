import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/app_service.dart';

class ServiceController extends ChangeNotifier {
  static ServiceController of(final BuildContext context) {
    return Provider.of<ServiceController>(context, listen: false);
  }

  static Future<ServiceController> setup() async {
    return ServiceController._(
      app: await AppService.setup(),
    );
  }

  final AppService app;

  ServiceController._({
    required this.app,
  });
}
