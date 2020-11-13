import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:poker/data/models/room_model.dart';
import 'package:poker/data/models/round_model.dart';
import 'package:poker/domain/entities/app_error.dart';
import 'package:poker/domain/entities/room_params.dart';
import 'package:poker/domain/entities/round_entity.dart';
import 'package:poker/domain/repositories/poker_repositories.dart';
import 'package:poker/domain/usecases/get_rounds.dart';

part 'room_event.dart';
part 'room_state.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  final GetRounds getRounds;
  final PokerRepository repository;
  RoomBloc(this.getRounds, this.repository) : super(RoomInitial());

  @override
  Stream<RoomState> mapEventToState(
    RoomEvent event,
  ) async* {
    if (event is EnterRoomEvent) {
      yield* _mapEnterRoomToState(event, state);
    } else if (event is AddRoundEvent) {
      yield* _mapAddRoundToState(event, state);
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
    final response = repository.addRound(event.accesKey, event.users);
  }
}
