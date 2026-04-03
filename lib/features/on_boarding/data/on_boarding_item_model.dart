import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_strings.dart';

class OnBoardingItemModel {
  final String image;
  final String title;
  final String subTitle;

  OnBoardingItemModel({
    required this.image,
    required this.title,
    required this.subTitle,
  });
}
List<OnBoardingItemModel> listOnBoardingItem = [
  OnBoardingItemModel(
    image: Assets.assetsImagesOnboarding1,
    title: AppStrings.onboarding1Title,
    subTitle: AppStrings.onboarding1Sub,
  ),
  OnBoardingItemModel(
 image: Assets.assetsImagesOnboarding2,
    title: AppStrings.onboarding2Title,
    subTitle: AppStrings.onboarding2Sub, ),
  OnBoardingItemModel(
    image: Assets.assetsImagesOnboarding3,
    title: AppStrings.onboarding3Title,
    subTitle: AppStrings.onboarding3Sub,  ),
];
