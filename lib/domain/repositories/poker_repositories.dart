import 'package:dartz/dartz.dart';
import 'package:poker/domain/entities/app_error.dart';
import 'package:poker/data/models/round_model.dart';
import 'package:poker/domain/entities/round_entity.dart';

abstract class PokerRepository {
  Future<Either<AppError, List<RoundEntity>>> getRounds(String accesKey);
}
