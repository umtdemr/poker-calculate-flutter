import 'package:poker/data/data_sources/poker_data_sources.dart';
import 'package:poker/domain/entities/app_error.dart';
import 'package:poker/data/models/round_model.dart';
import 'package:dartz/dartz.dart';
import 'package:poker/domain/entities/round_entity.dart';
import 'package:poker/domain/repositories/poker_repositories.dart';

class PokerRepositoryImpl extends PokerRepository {
  final PokerRemoteDataSource remoteDataSource;

  PokerRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, List<Round>>> getRounds(String accesKey) async {
    try {
      final rounds = await remoteDataSource.getRounds(accesKey);
      return Right(rounds);
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, bool>> addRound(String accesKey, List users) async {
    try {
      final isAdded = await remoteDataSource.addRound(accesKey, users);
      return Right(isAdded);
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }
}
