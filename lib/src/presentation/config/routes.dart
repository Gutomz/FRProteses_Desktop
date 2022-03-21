const String overviewPageRoute = "Dashboard";

const String customerPageRoute = "Clientes";
const String customerEditPageRoute = "Editar Cliente";
const String customerFilterSelectionPageRoute = "Filtrar Clientes";

const String providerPageRoute = "Fornecedores";
const String providerEditPageRoute = "Editar Fornecedor";
const String providerFilterSelectionPageRoute = "Filtrar Fornecedores";

const String productPageRoute = "Produtos";
const String productEditPageRoute = "Editar Produto";
const String productFilterSelectionPageRoute = "Filtrar Produtos";

const String orderPageRoute = "Pedidos";

const String paymentPageRoute = "Pagamentos";

final List<String> mainRoutes = [
  overviewPageRoute,
  customerPageRoute,
  providerPageRoute,
  productPageRoute,
  orderPageRoute,
  paymentPageRoute,
];

bool isMainRoute(String routeName) {
  return mainRoutes.contains(routeName);
}

String getFirstRoute() {
  return overviewPageRoute;
}
