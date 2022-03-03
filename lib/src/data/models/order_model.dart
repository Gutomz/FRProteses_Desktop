import 'package:frproteses/src/core/enums/order_model_type.dart';
import 'package:frproteses/src/core/enums/order_status_type.dart';
import 'package:frproteses/src/data/models/customer_model.dart';
import 'package:frproteses/src/data/models/dental_arch_model.dart';
import 'package:frproteses/src/data/models/order_item_model.dart';
import 'package:frproteses/src/domain/entities/customer_entity.dart';
import 'package:frproteses/src/domain/entities/dental_arch_entity.dart';
import 'package:frproteses/src/domain/entities/order_entity.dart';
import 'package:frproteses/src/domain/entities/order_item_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required int id,
    required String orderDate,
    required String deliveryDate,
    required CustomerEntity customer,
    required String patientName,
    required String color,
    required OrderModelType modelType,
    required DentalArchEntity dentalArch,
    required OrderStatusType statusType,
    required List<OrderItemEntity> items,
  }) : super(
          id: id,
          orderDate: orderDate,
          deliveryDate: deliveryDate,
          customer: customer,
          patientName: patientName,
          color: color,
          modelType: modelType,
          dentalArch: dentalArch,
          statusType: statusType,
          items: items,
        );

  factory OrderModel.copyFrom(OrderEntity orderEntity) {
    return OrderModel(
      id: orderEntity.id,
      orderDate: orderEntity.orderDate,
      deliveryDate: orderEntity.deliveryDate,
      customer: orderEntity.customer,
      patientName: orderEntity.patientName,
      color: orderEntity.color,
      modelType: orderEntity.modelType,
      dentalArch: orderEntity.dentalArch,
      statusType: orderEntity.statusType,
      items: orderEntity.items,
    );
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    List<OrderItemEntity> items = List.empty(growable: true);

    if (json.containsKey("items")) {
      items = (json["items"] as List)
          .map<OrderItemEntity>(
            (e) => OrderItemModel.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    return OrderModel(
      id: (json["id"] as num).toInt(),
      orderDate: json["orderDate"] as String,
      deliveryDate: json["deliveryDate"] as String,
      customer:
          CustomerModel.fromJson(json["customer"] as Map<String, dynamic>),
      patientName: json["patientName"] as String,
      color: json["color"] as String,
      modelType: json["modelType"] as OrderModelType,
      dentalArch:
          DentalArchModel.fromJson(json["dentalArch"] as Map<String, dynamic>),
      statusType: json["statusType"] as OrderStatusType,
      items: items,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "orderDate": orderDate,
      "deliveryDate": deliveryDate,
      "customer": CustomerModel.copyFrom(customer).toJson(),
      "patientName": patientName,
      "color": color,
      "modelType": modelType,
      "dentalArch": DentalArchModel.copyFrom(dentalArch).toJson(),
      "statusType": statusType,
      "items": items
          .map<Map<String, dynamic>>((e) => OrderItemModel.copyFrom(e).toJson())
          .toList(),
    };
  }
}
