import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:poker/domain/entities/add_room_params.dart';
import 'package:poker/domain/entities/app_error.dart';
import 'package:poker/domain/entities/delete_round_params.dart';
import 'package:poker/domain/entities/room_params.dart';
import 'package:poker/domain/entities/round_entity.dart';
import 'package:poker/domain/entities/round_params.dart';
import 'package:poker/domain/usecases/add_round.dart';
import 'package:poker/domain/usecases/create_room.dart';
import 'package:poker/domain/usecases/delete_round.dart';
import 'package:poker/domain/usecases/get_rounds.dart';

part 'room_event.dart';
part 'room_state.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  final GetRounds getRounds;
  final AddRound addRound;
  final CreateRoom createRoom;
  final DeleteRound deleteRound;
  RoomBloc(
    this.getRounds,
    this.addRound,
    this.createRoom,
    this.deleteRound,
  ) : super(RoomInitial());

  @override
  Stream<RoomState> mapEventToState(
    RoomEvent event,
  ) async* {
    if (event is EnterRoomEvent) {
      yield* _mapEnterRoomToState(event, state);
    } else if (event is AddRoundEvent) {
      yield* _mapAddRoundToState(event, state);
    } else if (event is CreateRoomEvent) {
      yield* _mapCreateRoomToState(event, state);
    } else if (event is DeleteRoundEvent) {
      final Either<AppError, bool> response = await deleteRound(
        DeleteRoundParams(index: event.index),
      );
      yield RoundDeletingState();
    }
  }

  Stream<RoomState> _mapEnterRoomToState(
      EnterRoomEvent event, RoomState state) async* {
    yield RoomLoadingState();
    final Either<AppError, List<RoundEntity>> response =
        await getRounds(RoomParams(event.accesKey));
    yield response.fold(
      (l) => RoomFailState(),
      (r) => RoomLoaded(
        accessKey: event.accesKey,
        rounds: r,
      ),
    );
  }

  Stream<RoomState> _mapAddRoundToState(
      AddRoundEvent event, RoomState state) async* {
    yield RoundAddingState();
    final Either<AppError, bool> response = await addRound(
        RoundParams(accesKey: event.accesKey, users: event.users));
    yield response.fold(
      (l) => RoomFailState(),
      (r) => RoundAddedState(event.accesKey),
    );
  }

  Stream<RoomState> _mapCreateRoomToState(
      CreateRoomEvent event, RoomState state) async* {
    yield CreatingRoomState();
    final Either<AppError, String> response = await createRoom(
      AddRoomParams(event.users),
    );

    yield response.fold(
      (l) => RoomFailState(),
      (accessKey) => RoomCreated(accessKey),
    );
  }
}
