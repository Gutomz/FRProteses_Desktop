import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:frproteses/src/core/utils/extensions.dart';
import 'package:frproteses/src/domain/entities/bank_account_entity.dart';
import 'package:frproteses/src/presentation/config/constants.dart';
import 'package:frproteses/src/presentation/pages/overview/store/overview_page_store.dart';
import 'package:frproteses/src/presentation/widgets/balance_widget.dart';
import 'package:frproteses/src/presentation/widgets/drop_down_text_field.dart';
import 'package:frproteses/src/presentation/widgets/overview_card.dart';

class OverviewLargeScreenPage extends StatelessWidget {
  final OverviewPageStore store;
  final Function(BuildContext, BankAccountEntity)? onPressedPrint;
  final TextEditingController customerFieldController;

  OverviewLargeScreenPage({
    Key? key,
    required this.store,
    required this.customerFieldController,
    this.onPressedPrint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kFormHorizontalSpacing, vertical: 10),
              child: Row(
                children: [
                  Flexible(
                    child: Observer(builder: (_) {
                      return DropDownTextField<BankAccountEntity?>(
                        label: "Cliente",
                        controller: customerFieldController,
                        data: [null, ...store.bankAccounts],
                        buildMenuItemText: (e) =>
                            e?.customerEntity.fullName ?? "Todos",
                        enabled: store.bankAccounts.isNotEmpty,
                        onChanged: store.setSelectedBankAccount,
                      );
                    }),
                  ),
                  Spacer(),
                  _buildBalanceWidget(context),
                ],
              ),
            ),
          ),
          SizedBox(height: kFormLineSpacing),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Observer(builder: (_) {
                  return OverviewCard(
                    title: "Pedidos",
                    value: store.ordersCount.toString(),
                  );
                }),
                SizedBox(width: kFormHorizontalSpacing),
                Observer(builder: (_) {
                  return OverviewCard(
                    title: "Pagamentos",
                    value: store.paymentsCount.toString(),
                  );
                }),
              ],
            ),
          ),
          SizedBox(height: kFormLineSpacing),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Observer(builder: (_) {
                  return OverviewCard(
                    title: "Total Pedidos",
                    value: store.totalOrders.formatMoney(),
                  );
                }),
                SizedBox(width: kFormHorizontalSpacing),
                Observer(builder: (_) {
                  return OverviewCard(
                    title: "Total Pagamentos",
                    value: store.totalPayments.formatMoney(),
                  );
                }),
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget _buildBalanceWidget(BuildContext context) {
    return Observer(builder: (_) {
      return BalanceWidget(
        bankAccount: store.selectedBankAccount,
        isDebit: store.balance < 0,
        onPressedPrint: onPressedPrint,
        isOutstanding: store.isOutstanding,
        isLarge: true,
        showValue: (bankAccountEntity) {
          if (bankAccountEntity == null) {
            return store.balance;
          }

          return bankAccountEntity.balance;
        },
      );
    });
  }
}
