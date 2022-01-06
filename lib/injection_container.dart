import 'package:get_it/get_it.dart';
import 'package:jb_fe/backend_integration/data/datasource/remote/business_remote_ds.dart';
import 'package:jb_fe/backend_integration/data/datasource/remote/item_remote_ds.dart';
import 'package:jb_fe/backend_integration/data/datasource/remote/party_remote_ds.dart';
import 'package:jb_fe/backend_integration/data/repositories/business_repository_impl.dart';
import 'package:jb_fe/backend_integration/data/repositories/item_repository_impl.dart';
import 'package:jb_fe/backend_integration/data/repositories/party_repository_impl.dart';
import 'package:jb_fe/backend_integration/domain/repositories/party_repository.dart';
import 'package:jb_fe/backend_integration/domain/usecase/business/get_business_data.dart';
import 'package:jb_fe/backend_integration/domain/usecase/inventory/fetch_item_images.dart';
import 'package:jb_fe/backend_integration/domain/usecase/inventory/get_item_page.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/create_party.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/delete_party.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/get_party_page.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/search_party.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/update_party.dart';
import 'package:jb_fe/controllers/bloc/business/business_data_bloc.dart';
import 'package:jb_fe/controllers/bloc/inventory/form_build_status/form_build_cubit.dart';
import 'package:jb_fe/controllers/bloc/inventory/item_bloc/item_bloc.dart';
import 'package:jb_fe/controllers/bloc/inventory/item_form_toggle/item_form_toggle_cubit.dart';
import 'package:jb_fe/controllers/bloc/inventory/item_image/item_image_bloc.dart';
import 'package:jb_fe/controllers/bloc/inventory/pieces_enabler/pieces_enabler_cubit.dart';
import 'package:jb_fe/controllers/bloc/party/new_party/add_party_bloc.dart';
import 'package:jb_fe/controllers/bloc/party/party_form_toggle/party_form_toggle_cubit.dart';
import 'package:jb_fe/controllers/bloc/party/search_party/search_party_bloc.dart';
import 'package:jb_fe/controllers/bloc/party/update_party/update_party_bloc.dart';

import 'backend_integration/domain/repositories/business_repository.dart';
import 'backend_integration/domain/repositories/item_repository.dart';
import 'backend_integration/domain/usecase/inventory/create_item.dart';
import 'backend_integration/domain/usecase/inventory/delete_item.dart';
import 'backend_integration/domain/usecase/inventory/search_item.dart';
import 'backend_integration/domain/usecase/inventory/update_item.dart';
import 'controllers/bloc/inventory/add_item/add_item_bloc.dart';
import 'controllers/bloc/inventory/delete_item/delete_item_bloc.dart';
import 'controllers/bloc/inventory/search_item/search_item_bloc.dart';
import 'controllers/bloc/inventory/update_item/update_item_bloc.dart';
import 'controllers/bloc/party/delete_party/delete_party_bloc.dart';
import 'controllers/bloc/party/party_bloc/party_bloc.dart';

final serviceLocator = GetIt.instance;

void init() {
  //bloc

  //Business
  serviceLocator.registerFactory<BusinessDataBloc>(
    () => BusinessDataBloc(getBusinessDataUseCase: serviceLocator()),
  );

  //party
  serviceLocator.registerFactory<PartyBloc>(
    () => PartyBloc(
      getPartyPageUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<UpdatePartyBloc>(
    () => UpdatePartyBloc(
      updatePartyUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<DeletePartyBloc>(
    () => DeletePartyBloc(
      deletePartyUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<SearchPartyBloc>(
    () => SearchPartyBloc(
      searchPartyUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<PartyFormToggleCubit>(
    () => PartyFormToggleCubit(),
  );
  serviceLocator.registerFactory<AddPartyBloc>(
    () => AddPartyBloc(
      createPartyUseCase: serviceLocator(),
    ),
  );

  //Inventory
  serviceLocator.registerFactory<ItemBloc>(
    () => ItemBloc(
      getItemPageUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<UpdateItemBloc>(
    () => UpdateItemBloc(
      updateItemUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<DeleteItemBloc>(
    () => DeleteItemBloc(
      deleteItemUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<SearchItemBloc>(
    () => SearchItemBloc(
      searchItemUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<ItemFormToggleCubit>(
    () => ItemFormToggleCubit(),
  );
  serviceLocator.registerFactory<AddItemBloc>(
    () => AddItemBloc(
      createItemUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<ItemImageBloc>(
    () => ItemImageBloc(
      fetchItemImagesUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<PiecesEnablerCubit>(
    () => PiecesEnablerCubit(),
  );
  serviceLocator.registerFactory<FormBuildCubit>(
    () => FormBuildCubit(),
  );

  //-----------------------------------------------------------------------------------------------------------------
  //usecases
  //Business
  serviceLocator.registerLazySingleton<GetBusinessDataUseCase>(
    () => GetBusinessDataUseCase(
      repository: serviceLocator(),
    ),
  );

  //party
  serviceLocator.registerLazySingleton<GetPartyPageUseCase>(
    () => GetPartyPageUseCase(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<UpdatePartyUseCase>(
    () => UpdatePartyUseCase(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<DeletePartyUseCase>(
    () => DeletePartyUseCase(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<SearchPartyUseCase>(
    () => SearchPartyUseCase(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<CreatePartyUseCase>(
    () => CreatePartyUseCase(
      repository: serviceLocator(),
    ),
  );

  //inventory
  serviceLocator.registerLazySingleton<GetItemPageUseCase>(
    () => GetItemPageUseCase(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<UpdateItemUseCase>(
    () => UpdateItemUseCase(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<DeleteItemUseCase>(
    () => DeleteItemUseCase(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<SearchItemUseCase>(
    () => SearchItemUseCase(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<CreateItemUseCase>(
    () => CreateItemUseCase(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<FetchItemImagesUseCase>(
    () => FetchItemImagesUseCase(
      repository: serviceLocator(),
    ),
  );

  //------------------------------------------------------------------------------------------------------------------
  //repository
  serviceLocator.registerLazySingleton<BusinessRepository>(
    () => BusinessRepositoryImpl(
      remoteDataSource: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<PartyRepository>(
    () => PartyRepositoryImpl(
      remoteDataSource: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<ItemRepository>(
    () => ItemRepositoryImpl(
      remoteDataSource: serviceLocator(),
    ),
  );

  //data sources
  serviceLocator.registerLazySingleton<BusinessRemoteDataSource>(
    () => BusinessRemoteDataSourceImpl(),
  );
  serviceLocator.registerLazySingleton<PartyRemoteDataSource>(
    () => PartyRemoteDataSourceImpl(),
  );
  serviceLocator.registerLazySingleton<ItemRemoteDataSource>(
    () => ItemRemoteDataSourceImpl(),
  );
}
