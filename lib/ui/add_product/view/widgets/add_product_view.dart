import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:product_stock_management_app/core/util/extension/widget_extension.dart';
import 'package:product_stock_management_app/ui/util/resource/color/color_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/style_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/values_manager.dart';
import 'package:product_stock_management_app/ui/util/widgets/custom_text_field.dart';

class AddProductViewBody extends StatelessWidget {
  const AddProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //region Name

            Text(
              "Name",
              style: Styles.getMediumStyle(
                color: colorOnBackgroundScaffold,
              ),
            ).marginOnly(bottom: AppPadding.p8),
            const CustomTextField(
              hintText: 'Enter name here',
              errorText: '* Name is required',
            ).marginOnly(bottom: AppPadding.p8),

            //endregion

            //region Price

            Text(
              "Price",
              style: Styles.getMediumStyle(
                color: colorOnBackgroundScaffold,
              ),
            ).marginOnly(bottom: AppPadding.p8),
            CustomTextField(
              hintText: 'Enter price here',
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              errorText: '* Price is required',
            ).marginOnly(bottom: AppPadding.p8),

            //endregion

            //region Quantity && Unit

            Text(
              "Quantity",
              style: Styles.getMediumStyle(
                color: colorOnBackgroundScaffold,
              ),
            ).marginOnly(bottom: AppPadding.p8),
            CustomTextField(
              hintText: 'Enter quantity here',
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              errorText: '* Quantity is required',
            ).marginOnly(bottom: AppPadding.p8),

            //endregion

            //region Unit

            Text(
              "Unit",
              style: Styles.getMediumStyle(
                color: colorOnBackgroundScaffold,
              ),
            ).marginOnly(bottom: AppPadding.p8),
            const CustomTextField(
              hintText: 'Enter unit here',
              errorText: '* Unit is required',
            ).marginOnly(bottom: AppPadding.p8),

            //endregion
          ],
        ),
      ),
    );
  }
}
