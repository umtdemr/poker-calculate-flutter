// import 'package:poker/domain/entities/round_params.dart';
// import 'package:poker/domain/usecases/usecase.dart';

// class AddRound extends UseCase<bool>, RoundParams> {
//   final PokerRepository repository;

//   AddRound(this.repository);

//   @override
//   Future<Either<AppError, List<RoundEntity>>> call(
//       RoomParams pokerParams) async {
//     return await repository.getRounds(pokerParams.accesKey);
//   }
// }

import 'package:dartz/dartz.dart';
import 'package:poker/domain/entities/app_error.dart';
import 'package:poker/domain/entities/round_params.dart';
import 'package:poker/domain/repositories/poker_repositories.dart';
import 'package:poker/domain/usecases/usecase.dart';

class AddRound extends UseCase<bool, RoundParams> {
  final PokerRepository repository;

  AddRound(this.repository);

  @override
  Future<Either<AppError, bool>> call(RoundParams roundParams) async {
    return await repository.addRound(roundParams.accesKey, roundParams.users);
  }
}
