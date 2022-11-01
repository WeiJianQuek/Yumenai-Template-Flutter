import '../../model/resource/image_resource_model.dart';

const _basePath = 'asset/image';

class ImageResourceData extends ImageResourceModel {
  const ImageResourceData.dark() : super(
    appLogo: '$_basePath/app-logo.png',
    appSplash: '$_basePath/app-splash.png',
  );

  const ImageResourceData.light() : super(
    appLogo: '$_basePath/app-logo.png',
    appSplash: '$_basePath/app-splash.png',
  );
}
