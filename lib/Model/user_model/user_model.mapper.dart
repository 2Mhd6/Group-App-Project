// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_model.dart';

class UserModelMapper extends ClassMapperBase<UserModel> {
  UserModelMapper._();

  static UserModelMapper? _instance;
  static UserModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserModel';

  static String _$userId(UserModel v) => v.userId;
  static const Field<UserModel, String> _f$userId = Field('userId', _$userId);
  static String _$name(UserModel v) => v.name;
  static const Field<UserModel, String> _f$name = Field('name', _$name);
  static String _$email(UserModel v) => v.email;
  static const Field<UserModel, String> _f$email = Field('email', _$email);
  static String _$phone(UserModel v) => v.phone;
  static const Field<UserModel, String> _f$phone = Field('phone', _$phone);
  static String _$notificationId(UserModel v) => v.notificationId;
  static const Field<UserModel, String> _f$notificationId =
      Field('notificationId', _$notificationId, key: r'notification_id');
  static DateTime _$joinedDate(UserModel v) => v.joinedDate;
  static const Field<UserModel, DateTime> _f$joinedDate =
      Field('joinedDate', _$joinedDate, key: r'joined_date');

  @override
  final MappableFields<UserModel> fields = const {
    #userId: _f$userId,
    #name: _f$name,
    #email: _f$email,
    #phone: _f$phone,
    #notificationId: _f$notificationId,
    #joinedDate: _f$joinedDate,
  };

  static UserModel _instantiate(DecodingData data) {
    return UserModel(
        userId: data.dec(_f$userId),
        name: data.dec(_f$name),
        email: data.dec(_f$email),
        phone: data.dec(_f$phone),
        notificationId: data.dec(_f$notificationId),
        joinedDate: data.dec(_f$joinedDate));
  }

  @override
  final Function instantiate = _instantiate;

  static UserModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserModel>(map);
  }

  static UserModel fromJson(String json) {
    return ensureInitialized().decodeJson<UserModel>(json);
  }
}

mixin UserModelMappable {
  String toJson() {
    return UserModelMapper.ensureInitialized()
        .encodeJson<UserModel>(this as UserModel);
  }

  Map<String, dynamic> toMap() {
    return UserModelMapper.ensureInitialized()
        .encodeMap<UserModel>(this as UserModel);
  }

  UserModelCopyWith<UserModel, UserModel, UserModel> get copyWith =>
      _UserModelCopyWithImpl<UserModel, UserModel>(
          this as UserModel, $identity, $identity);
  @override
  String toString() {
    return UserModelMapper.ensureInitialized()
        .stringifyValue(this as UserModel);
  }

  @override
  bool operator ==(Object other) {
    return UserModelMapper.ensureInitialized()
        .equalsValue(this as UserModel, other);
  }

  @override
  int get hashCode {
    return UserModelMapper.ensureInitialized().hashValue(this as UserModel);
  }
}

extension UserModelValueCopy<$R, $Out> on ObjectCopyWith<$R, UserModel, $Out> {
  UserModelCopyWith<$R, UserModel, $Out> get $asUserModel =>
      $base.as((v, t, t2) => _UserModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserModelCopyWith<$R, $In extends UserModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? userId,
      String? name,
      String? email,
      String? phone,
      String? notificationId,
      DateTime? joinedDate});
  UserModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserModel, $Out>
    implements UserModelCopyWith<$R, UserModel, $Out> {
  _UserModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserModel> $mapper =
      UserModelMapper.ensureInitialized();
  @override
  $R call(
          {String? userId,
          String? name,
          String? email,
          String? phone,
          String? notificationId,
          DateTime? joinedDate}) =>
      $apply(FieldCopyWithData({
        if (userId != null) #userId: userId,
        if (name != null) #name: name,
        if (email != null) #email: email,
        if (phone != null) #phone: phone,
        if (notificationId != null) #notificationId: notificationId,
        if (joinedDate != null) #joinedDate: joinedDate
      }));
  @override
  UserModel $make(CopyWithData data) => UserModel(
      userId: data.get(#userId, or: $value.userId),
      name: data.get(#name, or: $value.name),
      email: data.get(#email, or: $value.email),
      phone: data.get(#phone, or: $value.phone),
      notificationId: data.get(#notificationId, or: $value.notificationId),
      joinedDate: data.get(#joinedDate, or: $value.joinedDate));

  @override
  UserModelCopyWith<$R2, UserModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
