import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:poker/data/core/api_client.dart';
import 'package:poker/data/data_sources/poker_data_sources.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));
  getItInstance.registerLazySingleton<PokerRemoteDataSource>(
      () => PokerRemoteDataSourceImpl(getItInstance()));
}
