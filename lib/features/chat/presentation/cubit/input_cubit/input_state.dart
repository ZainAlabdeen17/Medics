import 'package:equatable/equatable.dart';

class InputState extends Equatable {
  final String? input;

  const InputState({this.input = ''});
  InputState copyWith({String? input}) {
    return InputState(input: input);
  }

  @override
  List<Object?> get props => [input];
}
