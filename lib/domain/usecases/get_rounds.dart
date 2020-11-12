import 'package:dartz/dartz.dart';
import 'package:poker/data/models/round_model.dart';
import 'package:poker/domain/entities/app_error.dart';
import 'package:poker/domain/entities/round_entity.dart';
import 'package:poker/domain/repositories/poker_repositories.dart';
import 'package:poker/domain/usecases/usecase.dart';
import 'package:poker/domain/entities/room_params.dart';

class GetRounds extends UseCase<List<RoundEntity>, RoomParams> {
  final PokerRepository repository;

  GetRounds(this.repository);

  @override
  Future<Either<AppError, List<RoundEntity>>> call(
      RoomParams pokerParams) async {
    return await repository.getRounds(pokerParams.accesKey);
  }
}
