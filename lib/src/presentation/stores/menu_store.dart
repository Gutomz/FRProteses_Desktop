import 'package:frproteses/src/presentation/config/routes.dart';
import 'package:mobx/mobx.dart';
part 'menu_store.g.dart';

class MenuStore = _MenuStoreBase with _$MenuStore;

abstract class _MenuStoreBase with Store {
  @observable
  String activeItem = getFirstRoute();

  @observable
  String hoverItem = "";

  @action
  void changeActiveItemTo(String itemName) => activeItem = itemName;

  @action
  void onHover(String itemName) {
    if (!isActive(itemName)) hoverItem = itemName;
  }

  bool isActive(String itemName) => activeItem == itemName;

  bool isHovering(String itemName) =>
      activeItem != itemName && hoverItem == itemName;
}
