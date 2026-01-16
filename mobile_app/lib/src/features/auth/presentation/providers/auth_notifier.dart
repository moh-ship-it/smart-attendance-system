//     data source Provider
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:mobile_app/src/features/auth/domain/usecases/add_user_usecase.dart';

import '../../../../core/providers/core_providers.dart';
import '../../../auth/data/data_source/auth_remote_datasource.dart';
import '../../../auth/data/repository/auth_repository_impl.dart';
import '../../../auth/domain/repository/auth_repository.dart';
import '../../../auth/domain/usecases/login_usecase.dart';
import '../state/auth_notifier.dart';
import '../state/auth_state.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDatasource>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return AuthRemoteDatasource(apiService: apiService);
});

//      repository Provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  return AuthRepositoryImpl(datasource: remoteDataSource);
});
//            بروفايدرات ال Use Case
final signUpUseCaseProvider = Provider<AddUserUsecase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return AddUserUsecase(repository: repository);
});

final logInUseCaseProvider = Provider<LoginUsecase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LoginUsecase(repository: repository);
});

//        البروفايدر الرئيسي
final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final addUserUseCase = ref.watch(signUpUseCaseProvider);
  final logInUseCae = ref.watch(logInUseCaseProvider);
  return AuthNotifier(
    loginUsecase: logInUseCae,
    addUserUsecase: addUserUseCase,
  );
});
