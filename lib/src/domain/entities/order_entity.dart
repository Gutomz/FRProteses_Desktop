import 'package:frproteses/src/core/enums/order_model_type.dart';
import 'package:frproteses/src/core/enums/order_status_type.dart';
import 'package:frproteses/src/domain/entities/customer_entity.dart';
import 'package:frproteses/src/domain/entities/dental_arch_entity.dart';
import 'package:frproteses/src/domain/entities/order_item_entity.dart';

class OrderEntity {
  int id;
  String orderDate;
  String deliveryDate;
  CustomerEntity customerEntity;
  String patientName;
  String scale;
  String color;
  OrderModelType? modelType;
  DentalArchEntity dentalArchEntity;
  List<OrderItemEntity> itemsEntity;
  OrderStatusType statusType;
  String notes;

  OrderEntity({
    required this.id,
    required this.orderDate,
    required this.deliveryDate,
    required this.customerEntity,
    required this.patientName,
    required this.scale,
    required this.color,
    required this.modelType,
    required this.dentalArchEntity,
    required this.statusType,
    required this.itemsEntity,
    required this.notes,
  });

  factory OrderEntity.empty(int id) {
    return OrderEntity(
      id: id,
      orderDate: "",
      deliveryDate: "",
      customerEntity: CustomerEntity.empty(0),
      patientName: "",
      scale: "",
      color: "",
      modelType: null,
      dentalArchEntity: DentalArchEntity.empty(),
      statusType: OrderStatusType.open,
      itemsEntity: List.empty(),
      notes: "",
    );
  }

  double get totalPrice {
    double _totalPrice = 0.0;
    for (final item in itemsEntity) {
      _totalPrice += item.totalPrice;
    }
    return _totalPrice;
  }
}
