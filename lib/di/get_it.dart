import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:poker/data/core/api_client.dart';
import 'package:poker/data/data_sources/poker_data_sources.dart';
import 'package:poker/data/repositories/poker_repository_impl.dart';
import 'package:poker/domain/repositories/poker_repositories.dart';
import 'package:poker/domain/usecases/add_round.dart';
import 'package:poker/domain/usecases/create_room.dart';
import 'package:poker/domain/usecases/get_rounds.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));
  getItInstance.registerLazySingleton<PokerRemoteDataSource>(
      () => PokerRemoteDataSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<PokerRepository>(
      () => PokerRepositoryImpl(getItInstance()));

  getItInstance
      .registerLazySingleton<GetRounds>(() => GetRounds(getItInstance()));

  getItInstance.registerFactory<AddRound>(() => AddRound(getItInstance()));
  getItInstance.registerFactory<CreateRoom>(() => CreateRoom(getItInstance()));
}
