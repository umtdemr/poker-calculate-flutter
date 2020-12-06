part of 'room_bloc.dart';

abstract class RoomEvent extends Equatable {
  const RoomEvent();

  @override
  List<Object> get props => [];
}

class RoomLoadingEvent extends RoomEvent {}

class EnterRoomEvent extends RoomEvent {
  final String accesKey;

  EnterRoomEvent(this.accesKey);

  @override
  List<Object> get props => [accesKey];
}

class AddRoundEvent extends RoomEvent {
  final String accesKey;
  final List users;

  AddRoundEvent({this.accesKey, this.users});

  @override
  List<Object> get props => [accesKey];
}

class CreateRoomEvent extends RoomEvent {
  final List users;

  CreateRoomEvent(this.users);

  @override
  List<Object> get props => [users];
}

class DeleteRoundEvent extends RoomEvent {
  final int index;

  DeleteRoundEvent(this.index);

  @override
  List<Object> get props => [index];
}
