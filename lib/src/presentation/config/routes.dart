const String overviewPageRoute = "Dashboard";
const String customerPageRoute = "Clientes";
const String providerPageRoute = "Fornecedores";
const String productPageRoute = "Produtos";
const String orderPageRoute = "Pedidos";
const String paymentPageRoute = "Pagamentos";

final List<String> routes = [
  overviewPageRoute,
  customerPageRoute,
  providerPageRoute,
  productPageRoute,
  orderPageRoute,
  paymentPageRoute,
];

String getFirstRoute() {
  return overviewPageRoute;
}
