// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'order_model.dart';

class OrderModelMapper extends ClassMapperBase<OrderModel> {
  OrderModelMapper._();

  static OrderModelMapper? _instance;
  static OrderModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OrderModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'OrderModel';

  static String _$orderId(OrderModel v) => v.orderId;
  static const Field<OrderModel, String> _f$orderId =
      Field('orderId', _$orderId, key: r'order_id');
  static String _$userId(OrderModel v) => v.userId;
  static const Field<OrderModel, String> _f$userId =
      Field('userId', _$userId, key: r'user_id');
  static double _$totalPrice(OrderModel v) => v.totalPrice;
  static const Field<OrderModel, double> _f$totalPrice =
      Field('totalPrice', _$totalPrice, key: r'total_price');
  static DateTime _$orderDate(OrderModel v) => v.orderDate;
  static const Field<OrderModel, DateTime> _f$orderDate =
      Field('orderDate', _$orderDate, key: r'order_date');
  static String _$address(OrderModel v) => v.address;
  static const Field<OrderModel, String> _f$address =
      Field('address', _$address);
  static double _$latitude(OrderModel v) => v.latitude;
  static const Field<OrderModel, double> _f$latitude =
      Field('latitude', _$latitude);
  static double _$longitude(OrderModel v) => v.longitude;
  static const Field<OrderModel, double> _f$longitude =
      Field('longitude', _$longitude);

  @override
  final MappableFields<OrderModel> fields = const {
    #orderId: _f$orderId,
    #userId: _f$userId,
    #totalPrice: _f$totalPrice,
    #orderDate: _f$orderDate,
    #address: _f$address,
    #latitude: _f$latitude,
    #longitude: _f$longitude,
  };

  static OrderModel _instantiate(DecodingData data) {
    return OrderModel(
        orderId: data.dec(_f$orderId),
        userId: data.dec(_f$userId),
        totalPrice: data.dec(_f$totalPrice),
        orderDate: data.dec(_f$orderDate),
        address: data.dec(_f$address),
        latitude: data.dec(_f$latitude),
        longitude: data.dec(_f$longitude));
  }

  @override
  final Function instantiate = _instantiate;

  static OrderModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OrderModel>(map);
  }

  static OrderModel fromJson(String json) {
    return ensureInitialized().decodeJson<OrderModel>(json);
  }
}

mixin OrderModelMappable {
  String toJson() {
    return OrderModelMapper.ensureInitialized()
        .encodeJson<OrderModel>(this as OrderModel);
  }

  Map<String, dynamic> toMap() {
    return OrderModelMapper.ensureInitialized()
        .encodeMap<OrderModel>(this as OrderModel);
  }

  OrderModelCopyWith<OrderModel, OrderModel, OrderModel> get copyWith =>
      _OrderModelCopyWithImpl<OrderModel, OrderModel>(
          this as OrderModel, $identity, $identity);
  @override
  String toString() {
    return OrderModelMapper.ensureInitialized()
        .stringifyValue(this as OrderModel);
  }

  @override
  bool operator ==(Object other) {
    return OrderModelMapper.ensureInitialized()
        .equalsValue(this as OrderModel, other);
  }

  @override
  int get hashCode {
    return OrderModelMapper.ensureInitialized().hashValue(this as OrderModel);
  }
}

extension OrderModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, OrderModel, $Out> {
  OrderModelCopyWith<$R, OrderModel, $Out> get $asOrderModel =>
      $base.as((v, t, t2) => _OrderModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class OrderModelCopyWith<$R, $In extends OrderModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? orderId,
      String? userId,
      double? totalPrice,
      DateTime? orderDate,
      String? address,
      double? latitude,
      double? longitude});
  OrderModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _OrderModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OrderModel, $Out>
    implements OrderModelCopyWith<$R, OrderModel, $Out> {
  _OrderModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OrderModel> $mapper =
      OrderModelMapper.ensureInitialized();
  @override
  $R call(
          {String? orderId,
          String? userId,
          double? totalPrice,
          DateTime? orderDate,
          String? address,
          double? latitude,
          double? longitude}) =>
      $apply(FieldCopyWithData({
        if (orderId != null) #orderId: orderId,
        if (userId != null) #userId: userId,
        if (totalPrice != null) #totalPrice: totalPrice,
        if (orderDate != null) #orderDate: orderDate,
        if (address != null) #address: address,
        if (latitude != null) #latitude: latitude,
        if (longitude != null) #longitude: longitude
      }));
  @override
  OrderModel $make(CopyWithData data) => OrderModel(
      orderId: data.get(#orderId, or: $value.orderId),
      userId: data.get(#userId, or: $value.userId),
      totalPrice: data.get(#totalPrice, or: $value.totalPrice),
      orderDate: data.get(#orderDate, or: $value.orderDate),
      address: data.get(#address, or: $value.address),
      latitude: data.get(#latitude, or: $value.latitude),
      longitude: data.get(#longitude, or: $value.longitude));

  @override
  OrderModelCopyWith<$R2, OrderModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _OrderModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
