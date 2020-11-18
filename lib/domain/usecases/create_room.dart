import 'package:dartz/dartz.dart';
import 'package:poker/domain/entities/add_room_params.dart';
import 'package:poker/domain/entities/app_error.dart';
import 'package:poker/domain/repositories/poker_repositories.dart';
import 'package:poker/domain/usecases/usecase.dart';

class CreateRoom extends UseCase<String, AddRoomParams> {
  final PokerRepository repository;

  CreateRoom(this.repository);

  @override
  Future<Either<AppError, String>> call(AddRoomParams roomParams) async {
    return await repository.createRoom(roomParams.users);
  }
}
