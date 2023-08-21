part of 'setting_cubit.dart';

class SettingState extends Equatable {
  double volume;
  SettingStatus status;

  SettingState({
    required this.volume,
    required this.status,
    //this.user,
  });
  factory SettingState.initial() {
    return SettingState(
      status: SettingStatus.initial,
      volume: instance.get<AppGlobal>().volumeApp,
    );
  }
  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [volume, status];

  SettingState copyWith({
    double? volume,
    SettingStatus? status,
  }) {
    return SettingState(
      volume: volume ?? this.volume,
      status: status ?? this.status,
      //user: user ?? this.user,
    );
  }
}
