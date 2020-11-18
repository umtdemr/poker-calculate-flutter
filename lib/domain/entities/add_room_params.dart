import 'package:equatable/equatable.dart';

class AddRoomParams extends Equatable {
  final List users;

  AddRoomParams(this.users);

  @override
  List<Object> get props => [users];
}
