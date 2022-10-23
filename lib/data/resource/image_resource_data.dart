const _basePath = 'asset/image';

class ImageResourceData {
  final ImageResourceApp app;

  const ImageResourceData.dark() : app = const ImageResourceApp(
    logo: '$_basePath/app-logo.png',
    splash: '$_basePath/app-splash.png',
  );

  const ImageResourceData.light() : app = const ImageResourceApp(
    logo: '$_basePath/app-logo.png',
    splash: '$_basePath/app-splash.png',
  );
}

class ImageResourceApp {
  final String logo;
  final String splash;

  const ImageResourceApp({
    required this.logo,
    required this.splash,
  });
}