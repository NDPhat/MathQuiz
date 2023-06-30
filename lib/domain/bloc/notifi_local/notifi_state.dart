part of 'notifi_cubit.dart';

class NotifiState extends Equatable {
  bool enable;
  NotifiState({required this.enable
      //this.user,
      });
  factory NotifiState.initial() {
    return NotifiState(enable: false
        //user: null,
        );
  }
  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [enable];

  NotifiState copyWith({bool? enable}) {
    return NotifiState(
      enable: enable ?? this.enable,
    );
  }
}
