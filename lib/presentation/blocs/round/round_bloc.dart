import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'round_event.dart';
part 'round_state.dart';

class RoundBloc extends Bloc<RoundEvent, RoundState> {
  RoundBloc() : super(RoundInitial());

  @override
  Stream<RoundState> mapEventToState(
    RoundEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
