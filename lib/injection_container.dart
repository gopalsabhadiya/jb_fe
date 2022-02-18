import 'package:get_it/get_it.dart';
import 'package:jb_fe/backend_integration/data/datasource/remote/authentication_remote_ds.dart';
import 'package:jb_fe/backend_integration/data/datasource/remote/business_remote_ds.dart';
import 'package:jb_fe/backend_integration/data/datasource/remote/daily_gold_rate_remote_ds.dart';
import 'package:jb_fe/backend_integration/data/datasource/remote/item_remote_ds.dart';
import 'package:jb_fe/backend_integration/data/datasource/remote/mail_remote_ds.dart';
import 'package:jb_fe/backend_integration/data/datasource/remote/order_remote_ds.dart';
import 'package:jb_fe/backend_integration/data/datasource/remote/party_remote_ds.dart';
import 'package:jb_fe/backend_integration/data/datasource/remote/user_remote_ds.dart';
import 'package:jb_fe/backend_integration/data/repositories/business_repository_impl.dart';
import 'package:jb_fe/backend_integration/data/repositories/daily_gold_rate_repository_impl.dart';
import 'package:jb_fe/backend_integration/data/repositories/item_repository_impl.dart';
import 'package:jb_fe/backend_integration/data/repositories/order_repository_impl.dart';
import 'package:jb_fe/backend_integration/data/repositories/party_repository_impl.dart';
import 'package:jb_fe/backend_integration/domain/repositories/order_repository.dart';
import 'package:jb_fe/backend_integration/domain/repositories/party_repository.dart';
import 'package:jb_fe/backend_integration/domain/usecase/authentication/un_authenticate_user.dart';
import 'package:jb_fe/backend_integration/domain/usecase/authentication/validate_authentication.dart';
import 'package:jb_fe/backend_integration/domain/usecase/business/get_business_data.dart';
import 'package:jb_fe/backend_integration/domain/usecase/daily_gold_rate/create_daily_gold_rate.dart';
import 'package:jb_fe/backend_integration/domain/usecase/inventory/fetch_item_images.dart';
import 'package:jb_fe/backend_integration/domain/usecase/inventory/get_item_page.dart';
import 'package:jb_fe/backend_integration/domain/usecase/mail/verify_otp.dart';
import 'package:jb_fe/backend_integration/domain/usecase/order/create_order.dart';
import 'package:jb_fe/backend_integration/domain/usecase/order/delete_order.dart';
import 'package:jb_fe/backend_integration/domain/usecase/order/get_order_page.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/create_party.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/delete_party.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/get_party_page.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/search_party.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/update_party.dart';
import 'package:jb_fe/backend_integration/utils/storage/shared_preference.dart';
import 'package:jb_fe/controllers/bloc/authentication/forgot_password/forgot_password_bloc.dart';
import 'package:jb_fe/controllers/bloc/business/business_data/business_data_bloc.dart';
import 'package:jb_fe/controllers/bloc/dashboard/daily_gold_rate/daily_gold_rate_bloc.dart';
import 'package:jb_fe/controllers/bloc/dashboard/new_daily_gold_rate/add_daily_gold_rate_bloc.dart';
import 'package:jb_fe/controllers/bloc/inventory/form_build_status/form_build_cubit.dart';
import 'package:jb_fe/controllers/bloc/inventory/item_bloc/item_bloc.dart';
import 'package:jb_fe/controllers/bloc/inventory/item_form_toggle/item_form_toggle_cubit.dart';
import 'package:jb_fe/controllers/bloc/inventory/item_image/item_image_bloc.dart';
import 'package:jb_fe/controllers/bloc/inventory/party_search_for_order/party_search_for_order_bloc.dart';
import 'package:jb_fe/controllers/bloc/inventory/pieces_enabler/pieces_enabler_cubit.dart';
import 'package:jb_fe/controllers/bloc/order/new_order/add_order_bloc.dart';
import 'package:jb_fe/controllers/bloc/order/order_form_toggle/order_form_toggle_cubit.dart';
import 'package:jb_fe/controllers/bloc/party/new_party/add_party_bloc.dart';
import 'package:jb_fe/controllers/bloc/party/party_form_toggle/party_form_toggle_cubit.dart';
import 'package:jb_fe/controllers/bloc/party/search_party/search_party_bloc.dart';
import 'package:jb_fe/controllers/bloc/party/update_party/update_party_bloc.dart';

import 'backend_integration/data/datasource/remote/receipt_remote_ds.dart';
import 'backend_integration/data/repositories/authentication_repository_impl.dart';
import 'backend_integration/data/repositories/mail_repository_impl.dart';
import 'backend_integration/data/repositories/receipt_repository_impl.dart';
import 'backend_integration/domain/repositories/authentication.dart';
import 'backend_integration/domain/repositories/business_repository.dart';
import 'backend_integration/domain/repositories/daily_gold_rate_repository.dart';
import 'backend_integration/domain/repositories/item_repository.dart';
import 'backend_integration/domain/repositories/mail_repository.dart';
import 'backend_integration/domain/repositories/receipt_repository.dart';
import 'backend_integration/domain/usecase/authentication/authenticate_user.dart';
import 'backend_integration/domain/usecase/business/update_business.dart';
import 'backend_integration/domain/usecase/daily_gold_rate/get_today_gold_rate.dart';
import 'backend_integration/domain/usecase/daily_gold_rate/update_daily_gold_rate.dart';
import 'backend_integration/domain/usecase/inventory/create_item.dart';
import 'backend_integration/domain/usecase/inventory/delete_item.dart';
import 'backend_integration/domain/usecase/inventory/search_item.dart';
import 'backend_integration/domain/usecase/inventory/update_item.dart';
import 'backend_integration/domain/usecase/mail/change_password.dart';
import 'backend_integration/domain/usecase/mail/send_otp_mail.dart';
import 'backend_integration/domain/usecase/order/fetch_batch_order.dart';
import 'backend_integration/domain/usecase/order/fetch_order.dart';
import 'backend_integration/domain/usecase/order/fetch_unpaid_orders.dart';
import 'backend_integration/domain/usecase/order/search_order.dart';
import 'backend_integration/domain/usecase/party/fetch_party.dart';
import 'backend_integration/domain/usecase/payment/create_receipt.dart';
import 'backend_integration/domain/usecase/payment/delete_receipt.dart';
import 'backend_integration/domain/usecase/payment/fetch_receipt.dart';
import 'backend_integration/domain/usecase/payment/get_receipt_page.dart';
import 'backend_integration/domain/usecase/payment/search_receipt.dart';
import 'controllers/bloc/authentication/login_logout/authentication_bloc.dart';
import 'controllers/bloc/business/update_business/update_business_bloc.dart';
import 'controllers/bloc/dashboard/update_daily_gold_rate/update_daily_gold_rate_bloc.dart';
import 'controllers/bloc/end_drawer/profile_or_settings/profile_or_settings_cubit.dart';
import 'controllers/bloc/inventory/add_item/add_item_bloc.dart';
import 'controllers/bloc/inventory/delete_item/delete_item_bloc.dart';
import 'controllers/bloc/inventory/search_item/search_item_bloc.dart';
import 'controllers/bloc/inventory/update_item/update_item_bloc.dart';
import 'controllers/bloc/order/delete_order/delete_order_bloc.dart';
import 'controllers/bloc/order/fetch_order/fetch_order_bloc.dart';
import 'controllers/bloc/order/order_bloc/order_bloc.dart';
import 'controllers/bloc/order/search_order/search_order_bloc.dart';
import 'controllers/bloc/party/delete_party/delete_party_bloc.dart';
import 'controllers/bloc/party/party_bloc/party_bloc.dart';
import 'controllers/bloc/receipt/delete_receipt/delete_receipt_bloc.dart';
import 'controllers/bloc/receipt/fetch_receipt/fetch_receipt_bloc.dart';
import 'controllers/bloc/receipt/new_receipt/add_receipt_bloc.dart';
import 'controllers/bloc/receipt/receipt_bloc/receipt_bloc.dart';
import 'controllers/bloc/receipt/receipt_form_toggle/receipt_form_toggle_cubit.dart';
import 'controllers/bloc/receipt/search_receipt/search_receipt_bloc.dart';
import 'controllers/bloc/receipt/unsorted_amount/unsorted_amount_cubit.dart';

final serviceLocator = GetIt.instance;

void init() {
  //bloc

  //Authentication
  serviceLocator.registerFactory<AuthenticationBloc>(
    () => AuthenticationBloc(
      authenticateUserUseCase: serviceLocator(),
      validateAuthenticationUseCase: serviceLocator(),
      unAuthenticateUserUseCase: serviceLocator(),
    ),
  );

  //Reset password
  serviceLocator.registerFactory<ForgotPasswordBloc>(
    () => ForgotPasswordBloc(
      sendOTPMailUseCase: serviceLocator(),
      verifyOtpUseCase: serviceLocator(),
      changePasswordUseCase: serviceLocator(),
    ),
  );

  //Business
  serviceLocator.registerFactory<BusinessDataBloc>(
    () => BusinessDataBloc(getBusinessDataUseCase: serviceLocator()),
  );

  serviceLocator.registerFactory<UpdateBusinessBloc>(
    () => UpdateBusinessBloc(updateBusinessUseCase: serviceLocator()),
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

  //order
  serviceLocator.registerFactory<OrderBloc>(
    () => OrderBloc(
      getOrderPageUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<AddOrderBloc>(
    () => AddOrderBloc(
      createOrderUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<OrderFormToggleCubit>(
    () => OrderFormToggleCubit(),
  );
  serviceLocator.registerFactory<PartySearchForOrderBloc>(
    () => PartySearchForOrderBloc(
      searchPartyUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<SearchOrderBloc>(
    () => SearchOrderBloc(
      searchOrderUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<DeleteOrderBloc>(
    () => DeleteOrderBloc(
      deleteOrderUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<FetchOrderBloc>(
    () => FetchOrderBloc(
      fetchOrderUseCase: serviceLocator(),
      fetchPartyUseCase: serviceLocator(),
    ),
  );

  //payment
  serviceLocator.registerFactory<ReceiptBloc>(
    () => ReceiptBloc(
      getReceiptPageUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<DeleteReceiptBloc>(
    () => DeleteReceiptBloc(
      deleteReceiptUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<SearchReceiptBloc>(
    () => SearchReceiptBloc(
      searchReceiptUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<ReceiptFormToggleCubit>(
    () => ReceiptFormToggleCubit(),
  );
  serviceLocator.registerFactory<AddReceiptBloc>(
    () => AddReceiptBloc(
      createReceiptUseCase: serviceLocator(),
      fetchUnpaidOrdersUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<FetchReceiptBloc>(
    () => FetchReceiptBloc(
      fetchReceiptUseCase: serviceLocator(),
      fetchPartyUseCase: serviceLocator(),
      fetchOrderBatchUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<UnsortedAmountCubit>(
    () => UnsortedAmountCubit(),
  );

  //Cart
  // serviceLocator.registerFactory<CartBloc>(
  //   () => CartBloc(
  //     createOrderUseCase: serviceLocator(),
  //   ),
  // );
  // serviceLocator.registerFactory<CartFormToggleCubit>(
  //   () => CartFormToggleCubit(),
  // );

  //daily gold rate
  serviceLocator.registerFactory<DailyGoldRateBloc>(
    () => DailyGoldRateBloc(getTodayGoldRateUseCase: serviceLocator()),
  );
  serviceLocator.registerFactory<AddDailyGoldRateBloc>(
    () => AddDailyGoldRateBloc(
      createDailyGoldRateUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<UpdateDailyGoldRateBloc>(
    () => UpdateDailyGoldRateBloc(
      updateDailyGoldRateUseCase: serviceLocator(),
    ),
  );

  //end drawer
  serviceLocator.registerFactory<ProfileOrSettingsCubit>(
    () => ProfileOrSettingsCubit(),
  );
  //-----------------------------------------------------------------------------------------------------------------
  //usecases

  //Reset Password
  serviceLocator.registerLazySingleton<SendOTPMailUseCase>(
    () => SendOTPMailUseCase(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<VerifyOTPUseCase>(
    () => VerifyOTPUseCase(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<ChangePasswordUseCase>(
    () => ChangePasswordUseCase(repository: serviceLocator()),
  );

  //authentication
  serviceLocator.registerLazySingleton<AuthenticateUserUseCase>(
    () => AuthenticateUserUseCase(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<ValidateAuthenticationUseCase>(
    () => ValidateAuthenticationUseCase(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<UnAuthenticateUserUseCase>(
    () => UnAuthenticateUserUseCase(
      repository: serviceLocator(),
    ),
  );

  //Business
  serviceLocator.registerLazySingleton<GetBusinessDataUseCase>(
    () => GetBusinessDataUseCase(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<UpdateBusinessUseCase>(
    () => UpdateBusinessUseCase(
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
  serviceLocator.registerLazySingleton<FetchPartyUseCase>(
    () => FetchPartyUseCase(
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

  //Daily gold rate
  serviceLocator.registerLazySingleton<CreateDailyGoldRateUseCase>(
    () => CreateDailyGoldRateUseCase(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<GetTodayGoldRateUseCase>(
    () => GetTodayGoldRateUseCase(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<UpdateTodayGoldRateUseCase>(
    () => UpdateTodayGoldRateUseCase(
      repository: serviceLocator(),
    ),
  );

  //order
  serviceLocator.registerLazySingleton<GetOrderPageUseCase>(
    () => GetOrderPageUseCase(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<CreateOrderUseCase>(
    () => CreateOrderUseCase(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<SearchOrderUseCase>(
    () => SearchOrderUseCase(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<DeleteOrderUseCase>(
    () => DeleteOrderUseCase(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<FetchOrderUseCase>(
    () => FetchOrderUseCase(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<FetchOrderBatchUseCase>(
    () => FetchOrderBatchUseCase(
      repository: serviceLocator(),
    ),
  );

  //payment
  serviceLocator.registerLazySingleton<GetReceiptPageUseCase>(
    () => GetReceiptPageUseCase(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<DeleteReceiptUseCase>(
    () => DeleteReceiptUseCase(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<SearchReceiptUseCase>(
    () => SearchReceiptUseCase(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<CreateReceiptUseCase>(
    () => CreateReceiptUseCase(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<FetchUnpaidOrdersUseCase>(
    () => FetchUnpaidOrdersUseCase(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => FetchReceiptUseCase(
      repository: serviceLocator(),
    ),
  );

  //------------------------------------------------------------------------------------------------------------------
  //repository
  serviceLocator.registerLazySingleton<MailRepository>(
    () => MailRepositoryImpl(
      remoteDataSource: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      authenticationRemoteDataSource: serviceLocator(),
      userRemoteDataSource: serviceLocator(),
    ),
  );
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
  serviceLocator.registerLazySingleton<DailyGoldRateRepository>(
    () => DailyGoldRateRepositoryImpl(
      remoteDataSource: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<OrderRepository>(
    () => OrderRepositoryImpl(
      remoteDataSource: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<ReceiptRepository>(
    () => ReceiptRepositoryImpl(
      remoteDataSource: serviceLocator(),
    ),
  );

  //data sources
  serviceLocator.registerLazySingleton<MailRemoteDataSource>(
    () => MailRemoteDataSourceImpl(),
  );
  serviceLocator.registerLazySingleton<AuthenticationRemoteDataSource>(
    () => AuthenticationRemoteDataSourceImpl(),
  );
  serviceLocator.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(),
  );
  serviceLocator.registerLazySingleton<BusinessRemoteDataSource>(
    () => BusinessRemoteDataSourceImpl(),
  );
  serviceLocator.registerLazySingleton<PartyRemoteDataSource>(
    () => PartyRemoteDataSourceImpl(),
  );
  serviceLocator.registerLazySingleton<ItemRemoteDataSource>(
    () => ItemRemoteDataSourceImpl(),
  );
  serviceLocator.registerLazySingleton<OrderRemoteDataSource>(
    () => OrderRemoteDataSourceImpl(),
  );
  serviceLocator.registerLazySingleton<ReceiptRemoteDataSource>(
    () => ReceiptRemoteDataSourceImpl(),
  );

  //daily gold rate
  serviceLocator.registerLazySingleton<DailyGoldRateRemoteDataSource>(
    () => DailyGoldRateRemoteDataSourceImpl(),
  );

  //Other
  serviceLocator.registerLazySingleton(
    () => AppSharedPreference(),
  );
}
