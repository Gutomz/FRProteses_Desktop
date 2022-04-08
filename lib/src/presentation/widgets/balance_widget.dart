import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:frproteses/src/core/utils/extensions.dart';
import 'package:frproteses/src/domain/entities/bank_account_entity.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({
    Key? key,
    this.bankAccount,
    this.onPressedPrint,
    this.isDebit = false,
    this.isOutstanding = false,
    this.isLarge = false,
    this.showValue,
  }) : super(key: key);

  final BankAccountEntity? bankAccount;
  final bool isDebit;
  final Function(BuildContext p1, BankAccountEntity p2)? onPressedPrint;
  final bool isOutstanding;
  final bool isLarge;
  final double Function(BankAccountEntity?)? showValue;

  @override
  Widget build(BuildContext context) {
    final value = (showValue != null
            ? showValue?.call(bankAccount)
            : bankAccount?.balance) ??
        0;
    return Material(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value.abs().formatMoney(),
            style: TextStyle(
              color: value == 0
                  ? null
                  : isDebit
                      ? Theme.of(context).colorScheme.error
                      : Theme.of(context).colorScheme.tertiary,
              fontSize: isLarge ? 20 : null,
            ),
          ),
          Badge(
            badgeContent: isOutstanding
                ? GestureDetector(
                    onTap: _getOnPressedPrint(context),
                    child: Tooltip(
                      message: "Extrato Pendente",
                      child: Icon(
                        Icons.error_outline_rounded,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  )
                : null,
            badgeColor: Theme.of(context).colorScheme.onErrorContainer,
            position: BadgePosition.topEnd(
              top: 0,
              end: 0,
            ),
            padding: EdgeInsets.all(0),
            child: IconButton(
              tooltip: "Imprimir Extrato",
              splashRadius: 18,
              onPressed: _getOnPressedPrint(context),
              icon: Icon(
                Icons.print_outlined,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Function()? _getOnPressedPrint(BuildContext context) {
    if (bankAccount != null) {
      return () => onPressedPrint?.call(context, bankAccount!);
    }

    return null;
  }
}
