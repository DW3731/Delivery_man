import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stackfood_multivendor_driver/feature/language/controllers/localization_controller.dart';
import 'package:stackfood_multivendor_driver/feature/language/domain/models/language_model.dart';
import 'package:stackfood_multivendor_driver/util/app_constants.dart';
import 'package:stackfood_multivendor_driver/util/dimensions.dart';
import 'package:stackfood_multivendor_driver/util/styles.dart';

class LanguageWidget extends StatelessWidget {
  final LanguageModel languageModel;
  final LocalizationController localizationController;
  final int index;

  const LanguageWidget({
    super.key,
    required this.languageModel,
    required this.localizationController,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        localizationController.setLanguage(Locale(
          AppConstants.languages[index].languageCode!,
          AppConstants.languages[index].countryCode,
        ));
        localizationController.setSelectIndex(index);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
        child: Row(
          children: [
           /* Image.asset(
              languageModel.imageUrl!,
              width: 40,
              height: 40,
            ),
            const SizedBox(width: Dimensions.paddingSizeSmall),*/
            Expanded(
              child: Text(
                languageModel.languageName!,
                style: robotoMedium.copyWith(
                  color: localizationController.selectedIndex == index
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).textTheme.bodyLarge!.color,
                ),
              ),
            ),
            if (localizationController.selectedIndex == index)
              Icon(
                Icons.check,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
