import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_stock_management_app/ui/add_product/viewmodel/add_product_viewmodel.dart';
import 'package:product_stock_management_app/ui/util/resource/values_manager.dart';
import 'package:product_stock_management_app/ui/util/state_render/generic_data_state.dart';
import 'package:product_stock_management_app/ui/util/widgets/custom_button.dart';
import 'package:product_stock_management_app/ui/util/widgets/custom_loading.dart';
import 'package:product_stock_management_app/ui/util/widgets/show_message.dart';

class AddProductButton extends ConsumerWidget {
  const AddProductButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<GenericDataState>(
      addProductViewmodelProvider.select((value) => value.addProductDataState),
      (previous, next) => _handleStateChange(context, ref),
    );
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: _buildButtonBasedOnState(context, ref),
    );
  }

  Widget _buildButtonBasedOnState(BuildContext context, WidgetRef ref) {
    final dataState = ref.watch(
      addProductViewmodelProvider.select(
        (value) => value.addProductDataState,
      ),
    );
    switch (dataState) {
      case GenericDataState.loading:
        return const SizedBox(
          height: 50,
          width: 50,
          child: Center(
            child: CustomLoading(),
          ),
        );
      default:
        return CustomButton(
          label: 'Add Product',
          onPressed: () => _onPressedAddProductButton(context, ref),
        );
    }
  }

  _onPressedAddProductButton(BuildContext context, WidgetRef ref) {
    ref.read(addProductViewmodelProvider.notifier).addProduct();
  }

  _handleStateChange(BuildContext context, WidgetRef ref) {
    final state = ref.read(addProductViewmodelProvider);
    if (state.addProductDataState == GenericDataState.success) {
      Navigator.pop(context, true);
      showMessage(
        context: context,
        message: 'Success',
        messageType: MessageType.success,
      );
    } else if (state.addProductDataState == GenericDataState.failure) {
      showMessage(context: context, message: state.errorMessage);
    }
  }
}
