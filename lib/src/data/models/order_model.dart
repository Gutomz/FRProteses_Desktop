import 'package:frproteses/src/core/enums/order_model_type.dart';
import 'package:frproteses/src/core/enums/order_status_type.dart';
import 'package:frproteses/src/core/utils/constants.dart';
import 'package:frproteses/src/data/models/customer_model.dart';
import 'package:frproteses/src/data/models/dental_arch_model.dart';
import 'package:frproteses/src/data/models/order_item_model.dart';
import 'package:frproteses/src/domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required int id,
    required String orderDate,
    required String deliveryDate,
    required CustomerModel customerModel,
    required String patientName,
    required String scale,
    required String color,
    required OrderModelType? modelType,
    required DentalArchModel dentalArchModel,
    required OrderStatusType statusType,
    required List<OrderItemModel> itemsModel,
    required String notes,
  }) : super(
          id: id,
          orderDate: orderDate,
          deliveryDate: deliveryDate,
          customerEntity: customerModel,
          patientName: patientName,
          scale: scale,
          color: color,
          modelType: modelType,
          dentalArchEntity: dentalArchModel,
          statusType: statusType,
          itemsEntity: itemsModel,
          notes: notes,
        );

  factory OrderModel.empty() {
    return OrderModel.copyFrom(OrderEntity.empty(0));
  }

  factory OrderModel.copyFrom(OrderEntity orderEntity) {
    return OrderModel(
      id: orderEntity.id,
      orderDate: orderEntity.orderDate,
      deliveryDate: orderEntity.deliveryDate,
      customerModel: CustomerModel.copyFrom(orderEntity.customerEntity),
      patientName: orderEntity.patientName,
      scale: orderEntity.scale,
      color: orderEntity.color,
      modelType: orderEntity.modelType,
      dentalArchModel: DentalArchModel.copyFrom(orderEntity.dentalArchEntity),
      statusType: orderEntity.statusType,
      itemsModel: orderEntity.itemsEntity
          .map((e) => OrderItemModel.copyFrom(e))
          .toList(),
      notes: orderEntity.notes,
    );
  }

  factory OrderModel.fromString(String str) {
    final fields = str.split(SplitFieldsPattern.orderModelPattern);

    try {
      return OrderModel(
        id: num.parse(fields[0]).toInt(),
        statusType: OrderStatusTypeExtension.parse(fields[1]),
        orderDate: fields[2],
        deliveryDate: fields[3],
        customerModel: CustomerModel.fromString(fields[4]),
        patientName: fields[5],
        scale: fields[6],
        color: fields[7],
        modelType: fields[8].isNotEmpty
            ? OrderModelTypeExtension.parse(fields[8])
            : null,
        dentalArchModel: DentalArchModel.fromString(fields[9]),
        itemsModel: fields[10]
            .split(SplitFieldsPattern.listSeparatorPattern)
            .map<OrderItemModel>((e) => OrderItemModel.fromString(e))
            .toList(),
        notes: fields[11],
      );
    } on Exception {
      return OrderModel.empty();
    }
  }

  @override
  String toString() {
    const pattern = SplitFieldsPattern.orderModelPattern;
    const listSeparatorPattern = SplitFieldsPattern.listSeparatorPattern;

    final str = StringBuffer();
    str.write("$id$pattern");
    str.write("${statusType.index}$pattern");
    str.write("$orderDate$pattern");
    str.write("$deliveryDate$pattern");
    str.write("${CustomerModel.copyFrom(customerEntity).toString()}$pattern");
    str.write("$patientName$pattern");
    str.write("$scale$pattern");
    str.write("$color$pattern");
    str.write("${modelType?.index ?? ""}$pattern");
    str.write(
        "${DentalArchModel.copyFrom(dentalArchEntity).toString()}$pattern");
    int count = 1;
    for (final item in itemsEntity) {
      final itemModel = OrderItemModel.copyFrom(item);
      str.write(itemModel.toString());
      if (count < itemsEntity.length) {
        str.write(listSeparatorPattern);
      } else {
        str.write(pattern);
      }
      count++;
    }
    str.write("$notes$pattern");
    return str.toString();
  }
}
