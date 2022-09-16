part of 'switch_bloc.dart';

class SwitchState extends Equatable {
  final bool switchValue;
  const SwitchState({
    required this.switchValue,
  });

  @override
  List<Object> get props => [switchValue];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'switchValue': switchValue});

    return result;
  }

  factory SwitchState.fromMap(Map<String, dynamic> map) {
    return SwitchState(
      switchValue: map['switchValue'] ?? false,
    );
  }
}

class SwitchInitial extends SwitchState {
  const SwitchInitial({required super.switchValue});
}
