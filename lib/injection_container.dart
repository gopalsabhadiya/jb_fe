import 'package:get_it/get_it.dart';
import 'package:jb_fe/backend_integration/data/datasource/party_remote_ds.dart';
import 'package:jb_fe/backend_integration/data/repositories/party_repository_impl.dart';
import 'package:jb_fe/backend_integration/domain/repositories/party_repository.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/delete_party.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/get_party_page.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/search_party.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/update_party.dart';
import 'package:jb_fe/controllers/bloc/party/search_party/search_party_bloc.dart';
import 'package:jb_fe/controllers/bloc/party/update_party/update_party_bloc.dart';

import 'controllers/bloc/party/delete_party/delete_party_bloc.dart';
import 'controllers/bloc/party/party_bloc/party_bloc.dart';

final serviceLocator = GetIt.instance;

void init() {
  //bloc
  serviceLocator.registerFactory(() =>
      PartyBloc(getPartyPage: serviceLocator(), searchParty: serviceLocator()));
  serviceLocator.registerFactory(
      () => UpdatePartyBloc(updatePartyUseCase: serviceLocator()));
  serviceLocator.registerFactory(
      () => DeletePartyBloc(deletePartyUseCase: serviceLocator()));
  serviceLocator.registerFactory(
      () => SearchPartyBloc(searchPartyUseCase: serviceLocator()));

  //usecases
  serviceLocator.registerLazySingleton(
      () => GetPartyPageUseCase(repository: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => UpdatePartyUseCase(repository: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => DeletePartyUseCase(repository: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => SearchPartyUseCase(repository: serviceLocator()));

  //repository
  serviceLocator.registerLazySingleton<PartyRepository>(
      () => PartyRepositoryImpl(remoteDataSource: serviceLocator()));

  //data sources
  serviceLocator.registerLazySingleton<PartyRemoteDataSource>(
      () => PartyRemoteDataSourceImpl());
}
