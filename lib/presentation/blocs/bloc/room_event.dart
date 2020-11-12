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