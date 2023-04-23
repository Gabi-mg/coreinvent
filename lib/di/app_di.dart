import 'package:coreinvent/core/network/dio_http_client.dart';
import 'package:coreinvent/data/memory_datasource/memory_datasource.dart';
import 'package:coreinvent/data/remote_datasource/api/api.dart';
import 'package:coreinvent/data/remote_datasource/remote_datasource.dart';
import 'package:coreinvent/data/repository/repository.dart';
import 'package:coreinvent/domain/repository/repository.dart';
import 'package:coreinvent/domain/usecase/login_usecase.dart';
import 'package:coreinvent/ui/screens/home/bloc/home_bloc.dart';
import 'package:coreinvent/ui/screens/login/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;
const String baseUrl = 'https://prueba-service.coreinvent.es';

Future<void> init() async {
  // Register dio module
  serviceLocator.registerLazySingleton(() {
    var dioClient = DioClient();

    dioClient.addBadCertificateCallBack();
    return dioClient.getDio();
  });

  // Api
  serviceLocator.registerLazySingleton(
    () => Api(
      serviceLocator(),
      baseUrl: baseUrl,
    ),
  );

  //datasources
  serviceLocator.registerLazySingleton<RemoteDataSourceContract>(
    () => RemoteDataSource(
      api: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<MemoryDataSourceContract>(
        () => MemoryDataSource(),
  );

  //repositories
  serviceLocator.registerLazySingleton<RepositoryContract>(
    () => Repository(
        remoteDataSource: serviceLocator(), memoryDataSource: serviceLocator()),
  );

  //usecases
  serviceLocator.registerLazySingleton(
    () => LoginUsecase(
      serviceLocator(),
    ),
  );

  //Blocs
  serviceLocator.registerFactory(
    () => LoginBloc(serviceLocator()),
  );
  serviceLocator.registerFactory(
        () => HomeBloc(serviceLocator()),
  );
}
