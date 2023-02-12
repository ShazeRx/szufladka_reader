import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user_entity.freezed.dart';

@freezed
class AppUserEntity with _$AppUserEntity {
  const factory AppUserEntity({
    required String id,
  }) = _AppUserEntity;
}
