import 'package:stackfood_multivendor_driver/helper/price_converter_helper.dart';
import 'package:stackfood_multivendor_driver/util/dimensions.dart';
import 'package:stackfood_multivendor_driver/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class EarningWidget extends StatelessWidget {
  final String title;
  final double? amount;
  const EarningWidget({super.key, required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Column(children: [

      Text(
        title,
        style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeSmall, color:Colors.black),
      ),
      const SizedBox(height: Dimensions.paddingSizeSmall),

      amount != null ? Text(
        PriceConverter.convertPrice(amount),
        style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: Colors.black),
        maxLines: 1, overflow: TextOverflow.ellipsis,
      ) : Shimmer(
        duration: const Duration(seconds: 2),
        enabled: amount == null,
        color: Colors.black,
        child: Container(height: 20, width: 40, color: Theme.of(context).cardColor),
      ),

    ]));
  }
}