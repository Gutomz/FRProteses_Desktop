import 'package:frproteses/src/core/enums/order_model_type.dart';
import 'package:frproteses/src/core/enums/order_status_type.dart';
import 'package:frproteses/src/domain/entities/customer_entity.dart';
import 'package:frproteses/src/domain/entities/dental_arch_entity.dart';
import 'package:frproteses/src/domain/entities/order_item_entity.dart';

class OrderEntity {
  int id;
  String orderDate;
  String deliveryDate;
  CustomerEntity customer;
  String patientName;
  String color;
  OrderModelType modelType;
  DentalArchEntity dentalArch;
  List<OrderItemEntity> items;
  OrderStatusType statusType;

  OrderEntity({
    required this.id,
    required this.orderDate,
    required this.deliveryDate,
    required this.customer,
    required this.patientName,
    required this.color,
    required this.modelType,
    required this.dentalArch,
    required this.statusType,
    required this.items,
  });
}
