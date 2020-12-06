import 'package:dartz/dartz.dart';
import 'package:poker/domain/entities/app_error.dart';
import 'package:poker/domain/entities/delete_round_params.dart';
import 'package:poker/domain/repositories/poker_repositories.dart';
import 'package:poker/domain/usecases/usecase.dart';

class DeleteRound extends UseCase<bool, DeleteRoundParams> {
  final PokerRepository repository;

  DeleteRound(this.repository);

  @override
  Future<Either<AppError, bool>> call(
      DeleteRoundParams deleteRoundParams) async {
    return await repository.deleteRound(deleteRoundParams.index);
  }
}
