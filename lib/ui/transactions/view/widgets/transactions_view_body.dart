import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_stock_management_app/core/util/extension/context_extension.dart';
import 'package:product_stock_management_app/ui/transactions/view/widgets/item_transaction.dart';
import 'package:product_stock_management_app/ui/transactions/viewmodel/transactions_viewmodel.dart';
import 'package:product_stock_management_app/ui/util/resource/assets_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/color/color_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/font_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/style_manager.dart';
import 'package:product_stock_management_app/ui/util/state_render/generic_data_state.dart';
import 'package:product_stock_management_app/ui/util/widgets/custom_loading.dart';
import 'package:product_stock_management_app/ui/util/widgets/custom_svg_picture.dart';

import 'header_table_transaction.dart';

class TransactionsViewBody extends ConsumerWidget {
  const TransactionsViewBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const HeaderTableTransaction(),
        Expanded(
          child: _buildProductsBasedOnState(context, ref),
        ),
      ],
    );
  }

  Widget _buildProductsBasedOnState(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(
      transactionsViewmodelProvider.select(
        (value) => value.transactions,
      ),
    );
    final dataState = ref.watch(
      transactionsViewmodelProvider.select(
        (value) => value.getTransactionsDataState,
      ),
    );
    final errorMessage = ref.watch(
      transactionsViewmodelProvider.select(
        (value) => value.errorMessage,
      ),
    );
    switch (dataState) {
      case GenericDataState.loading:
        return const Center(
          child: CustomLoading(),
        );
      case GenericDataState.success:
        return ListView.builder(
          itemBuilder: (context, index) => ItemTransaction(transaction: transactions[index]),
          itemCount: transactions.length,
        );
      case GenericDataState.empty:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomSvgPicture(
              assetName: AssetsManager.imgEmptyProducts,
              width: context.getWidth * 0.6,
              height: context.getWidth * 0.6,
            ),
            Text(
              'Empty Data',
              style: Styles.getMediumStyle(
                color: colorOnBackgroundScaffold,
                fontSize: FontSize.s18,
              ),
            ),
          ],
        );
      case GenericDataState.failure:
        return Center(
          child: Text(
            errorMessage,
            style: Styles.getBoldStyle(
              color: colorError,
              fontSize: FontSize.s24,
            ),
          ),
        );
      default:
        return const SizedBox();
    }
  }

// List<Transaction> getTransactions() {
//   return [
//     Transaction(id: 1976, productId: 110010, productName: 'Product 1', quantityChange: -21, date: '02/10/2024'),
//     Transaction(id: 1977, productId: 110011, productName: 'Product 2', quantityChange: 15, date: '02/11/2024'),
//     Transaction(id: 1978, productId: 110012, productName: 'Product 3', quantityChange: -12, date: '02/12/2024'),
//     Transaction(id: 1979, productId: 110013, productName: 'Product 4', quantityChange: 10, date: '02/13/2024'),
//     Transaction(id: 1980, productId: 110014, productName: 'Product 5', quantityChange: -18, date: '02/14/2024'),
//     Transaction(id: 1981, productId: 110015, productName: 'Product 6', quantityChange: 25, date: '02/15/2024'),
//     Transaction(id: 1982, productId: 110016, productName: 'Product 7', quantityChange: -8, date: '02/16/2024'),
//     Transaction(id: 1983, productId: 110017, productName: 'Product 8', quantityChange: 13, date: '02/17/2024'),
//     Transaction(id: 1984, productId: 110018, productName: 'Product 9', quantityChange: -5, date: '02/18/2024'),
//     Transaction(id: 1985, productId: 110019, productName: 'Product 10', quantityChange: 7, date: '02/19/2024'),
//     Transaction(id: 1986, productId: 110020, productName: 'Product 11', quantityChange: -30, date: '02/20/2024'),
//     Transaction(id: 1987, productId: 110021, productName: 'Product 12', quantityChange: 20, date: '02/21/2024'),
//     Transaction(id: 1988, productId: 110022, productName: 'Product 13', quantityChange: -15, date: '02/22/2024'),
//     Transaction(id: 1989, productId: 110023, productName: 'Product 14', quantityChange: 10, date: '02/23/2024'),
//     Transaction(id: 1990, productId: 110024, productName: 'Product 15', quantityChange: -22, date: '02/24/2024'),
//     Transaction(id: 1991, productId: 110025, productName: 'Product 16', quantityChange: 18, date: '02/25/2024'),
//     Transaction(id: 1992, productId: 110026, productName: 'Product 17', quantityChange: -10, date: '02/26/2024'),
//     Transaction(id: 1993, productId: 110027, productName: 'Product 18', quantityChange: 12, date: '02/27/2024'),
//     Transaction(id: 1994, productId: 110028, productName: 'Product 19', quantityChange: -7, date: '02/28/2024'),
//     Transaction(id: 1995, productId: 110029, productName: 'Product 20', quantityChange: 8, date: '02/29/2024'),
//     Transaction(id: 1996, productId: 110030, productName: 'Product 21', quantityChange: -25, date: '03/01/2024'),
//     Transaction(id: 1997, productId: 110031, productName: 'Product 22', quantityChange: 14, date: '03/02/2024'),
//     Transaction(id: 1998, productId: 110032, productName: 'Product 23', quantityChange: -12, date: '03/03/2024'),
//     Transaction(id: 1999, productId: 110033, productName: 'Product 24', quantityChange: 16, date: '03/04/2024'),
//     Transaction(id: 2000, productId: 110034, productName: 'Product 25', quantityChange: -19, date: '03/05/2024'),
//     Transaction(id: 2001, productId: 110035, productName: 'Product 26', quantityChange: 22, date: '03/06/2024'),
//     Transaction(id: 2002, productId: 110036, productName: 'Product 27', quantityChange: -14, date: '03/07/2024'),
//     Transaction(id: 2003, productId: 110037, productName: 'Product 28', quantityChange: 10, date: '03/08/2024'),
//     Transaction(id: 2004, productId: 110038, productName: 'Product 29', quantityChange: -9, date: '03/09/2024'),
//     Transaction(id: 2005, productId: 110039, productName: 'Product 30', quantityChange: 17, date: '03/10/2024'),
//     Transaction(id: 2006, productId: 110040, productName: 'Product 31', quantityChange: -20, date: '03/11/2024'),
//     Transaction(id: 2007, productId: 110041, productName: 'Product 32', quantityChange: 15, date: '03/12/2024'),
//     Transaction(id: 2008, productId: 110042, productName: 'Product 33', quantityChange: -11, date: '03/13/2024'),
//     Transaction(id: 2009, productId: 110043, productName: 'Product 34', quantityChange: 10, date: '03/14/2024'),
//     Transaction(id: 2010, productId: 110044, productName: 'Product 35', quantityChange: -13, date: '03/15/2024'),
//     Transaction(id: 2011, productId: 110045, productName: 'Product 36', quantityChange: 19, date: '03/16/2024'),
//     Transaction(id: 2012, productId: 110046, productName: 'Product 37', quantityChange: -17, date: '03/17/2024'),
//     Transaction(id: 2013, productId: 110047, productName: 'Product 38', quantityChange: 12, date: '03/18/2024'),
//     Transaction(id: 2014, productId: 110048, productName: 'Product 39', quantityChange: -14, date: '03/19/2024'),
//     Transaction(id: 2015, productId: 110049, productName: 'Product 40', quantityChange: 20, date: '03/20/2024'),
//   ];
// }
}
