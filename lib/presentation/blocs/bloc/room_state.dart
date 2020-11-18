part of 'room_bloc.dart';

abstract class RoomState extends Equatable {
  const RoomState();

  @override
  List<Object> get props => [];
}

class RoomInitial extends RoomState {}

class RoomLoadingState extends RoomState {}

class RoomLoaded extends RoomState {
  final String accessKey;
  final List<RoundEntity> rounds;

  RoomLoaded({this.accessKey, this.rounds});

  @override
  List<Object> get props => [accessKey];
}

class RoundAddingState extends RoomState {}

class RoundAddedState extends RoomState {
  final String accessKey;

  RoundAddedState(this.accessKey);

  @override
  List<Object> get props => [accessKey];
}

class RoomFailState extends RoomState {}

class CreatingRoomState extends RoomState {}

class RoomCreated extends RoomState {
  final String accessKey;

  RoomCreated(this.accessKey);

  @override
  List<Object> get props => [accessKey];
}
