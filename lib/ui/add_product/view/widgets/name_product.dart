import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_stock_management_app/core/util/extension/widget_extension.dart';
import 'package:product_stock_management_app/ui/add_product/viewmodel/add_product_viewmodel.dart';
import 'package:product_stock_management_app/ui/util/resource/color/color_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/style_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/values_manager.dart';
import 'package:product_stock_management_app/ui/util/widgets/custom_text_field.dart';

class NameProduct extends ConsumerWidget {
  const NameProduct({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorText = ref.watch(addProductViewmodelProvider.select((value) => value.nameValidationMessage));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Name",
          style: Styles.getMediumStyle(
            color: colorOnBackgroundScaffold,
          ),
        ).marginOnly(bottom: AppPadding.p8),
        CustomTextField(
          hintText: 'Enter name here',
          errorText: errorText.isEmpty ? null : errorText,
          onChanged: (value) => ref.read(addProductViewmodelProvider.notifier).changeName(value),
        ),
      ],
    );
  }
}
