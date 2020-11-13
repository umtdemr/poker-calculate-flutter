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

class RoundAddedState extends RoomState {}

class RoomFailState extends RoomState {}
