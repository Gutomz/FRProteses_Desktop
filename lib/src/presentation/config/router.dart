// ignore_for_file: cast_nullable_to_non_nullable

import 'package:flutter/material.dart';
import 'package:frproteses/src/presentation/config/routes.dart';
import 'package:frproteses/src/presentation/pages/customers/customers_page.dart';
import 'package:frproteses/src/presentation/pages/customers/sub_pages/edit/customer_edit_page.dart';
import 'package:frproteses/src/presentation/pages/customers/sub_pages/filter_selection/customer_filter_selection_page.dart';
import 'package:frproteses/src/presentation/pages/orders/orders_page.dart';
import 'package:frproteses/src/presentation/pages/orders/sub_pages/edit/order_edit_page.dart';
import 'package:frproteses/src/presentation/pages/orders/sub_pages/filter_selection/order_filter_selection_page.dart';
import 'package:frproteses/src/presentation/pages/overview/overview_page.dart';
import 'package:frproteses/src/presentation/pages/payments/payments_page.dart';
import 'package:frproteses/src/presentation/pages/payments/sub_pages/edit/payment_edit_page.dart';
import 'package:frproteses/src/presentation/pages/payments/sub_pages/filter_selection/payment_filter_selection_page.dart';
import 'package:frproteses/src/presentation/pages/products/products_page.dart';
import 'package:frproteses/src/presentation/pages/products/sub_pages/edit/product_edit_page.dart';
import 'package:frproteses/src/presentation/pages/products/sub_pages/filter_selection/product_filter_selection_page.dart';
import 'package:frproteses/src/presentation/pages/providers/providers_page.dart';
import 'package:frproteses/src/presentation/pages/providers/sub_pages/edit/provider_edit_page.dart';
import 'package:frproteses/src/presentation/pages/providers/sub_pages/filter_selection/provider_filter_selection_page.dart';
import 'package:frproteses/src/presentation/pages/settings/settings_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final Widget page;
  switch (settings.name) {
    case customerPageRoute:
      page = CustomersPage();
      break;

    case customerEditPageRoute:
      final args = settings.arguments;
      assert(
        args != null && args is CustomerEditPageArguments,
        "CustomerEditPage requires CustomerEditPageArguments as Parameters",
      );
      page = CustomerEditPage(arguments: args as CustomerEditPageArguments);
      break;

    case customerFilterSelectionPageRoute:
      final args = settings.arguments;
      assert(args != null && args is CustomerFilterSelectionPageArguments,
          "CustomerFilterSelectionPage requires CustomerFilterSelectionPageArguments as Parameters");
      page = CustomerFilterSelectionPage(
          arguments: args as CustomerFilterSelectionPageArguments);
      break;

    case providerPageRoute:
      page = ProvidersPage();
      break;

    case providerEditPageRoute:
      final args = settings.arguments;
      assert(
        args != null && args is ProviderEditPageArguments,
        "ProviderEditPage requires ProviderEditPageArguments as Parameters",
      );
      page = ProviderEditPage(arguments: args as ProviderEditPageArguments);
      break;

    case providerFilterSelectionPageRoute:
      final args = settings.arguments;
      assert(args != null && args is ProviderFilterSelectionPageArguments,
          "ProviderFilterSelectionPage requires ProviderFilterSelectionPageArguments as Parameters");
      page = ProviderFilterSelectionPage(
          arguments: args as ProviderFilterSelectionPageArguments);
      break;

    case productPageRoute:
      page = ProductsPage();
      break;

    case productEditPageRoute:
      final args = settings.arguments;
      assert(
        args != null && args is ProductEditPageArguments,
        "ProductEditPage requires ProductEditPageArguments as Parameters",
      );
      page = ProductEditPage(arguments: args as ProductEditPageArguments);
      break;

    case productFilterSelectionPageRoute:
      final args = settings.arguments;
      assert(args != null && args is ProductFilterSelectionPageArguments,
          "ProductFilterSelectionPage requires ProductFilterSelectionPageArguments as Parameters");
      page = ProductFilterSelectionPage(
          arguments: args as ProductFilterSelectionPageArguments);
      break;

    case orderPageRoute:
      page = OrdersPage();
      break;

    case orderEditPageRoute:
      final args = settings.arguments;
      assert(
        args != null && args is OrderEditPageArguments,
        "OrderEditPage requires OrderEditPageArguments as Parameters",
      );
      page = OrderEditPage(arguments: args as OrderEditPageArguments);
      break;

    case orderFilterSelectionPageRoute:
      final args = settings.arguments;
      assert(args != null && args is OrderFilterSelectionPageArguments,
          "OrderFilterSelectionPage requires OrderFilterSelectionPageArguments as Parameters");
      page = OrderFilterSelectionPage(
          arguments: args as OrderFilterSelectionPageArguments);
      break;

    case paymentPageRoute:
      page = PaymentsPage();
      break;

    case paymentEditPageRoute:
      final args = settings.arguments;
      assert(
        args != null && args is PaymentEditPageArguments,
        "PaymentEditPage requires PaymentEditPageArguments as Parameters",
      );
      page = PaymentEditPage(arguments: args as PaymentEditPageArguments);
      break;

    case paymentFilterSelectionPageRoute:
      final args = settings.arguments;
      assert(args != null && args is PaymentFilterSelectionPageArguments,
          "PaymentFilterSelectionPage requires PaymentFilterSelectionPageArguments as Parameters");
      page = PaymentFilterSelectionPage(
          arguments: args as PaymentFilterSelectionPageArguments);
      break;

    case settingsPageRoute:
      page = SettingsPage();
      break;

    case overviewPageRoute:
    default:
      page = OverviewPage();
      break;
  }

  return _getPageRoute(page, settings);
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return MaterialPageRoute(builder: (context) => child, settings: settings);
}
