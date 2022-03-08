import 'package:flutter/material.dart';
import 'package:frproteses/src/presentation/config/routes.dart';
import 'package:frproteses/src/presentation/pages/customers/customer_page.dart';
import 'package:frproteses/src/presentation/pages/orders/orders_page.dart';
import 'package:frproteses/src/presentation/pages/overview/overview_page.dart';
import 'package:frproteses/src/presentation/pages/payments/payments_page.dart';
import 'package:frproteses/src/presentation/pages/products/products_page.dart';
import 'package:frproteses/src/presentation/pages/providers/providers_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case customerPageRoute:
      return _getPageRoute(CustomersPage());
    case providerPageRoute:
      return _getPageRoute(ProvidersPage());
    case productPageRoute:
      return _getPageRoute(ProductsPage());
    case orderPageRoute:
      return _getPageRoute(OrdersPage());
    case paymentPageRoute:
      return _getPageRoute(PaymentsPage());
    case overviewPageRoute:
    default:
      return _getPageRoute(OverviewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
