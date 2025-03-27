import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/domain/entities/user.dart';
import 'package:gym_app/domain/repositories/user_repository.dart';
import 'package:gym_app/infrastructure/errors/custom_error.dart';
import 'package:gym_app/presentation/providers/global_message_provider.dart';
import 'package:gym_app/presentation/providers/user/user_repository_provider.dart';


final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final repository = ref.watch(userRepositoryProvider);
  final globalMessageNotifier = ref.watch(globalMessageProvider.notifier);
  return AuthNotifier(repository: repository, globalMessageNotifier: globalMessageNotifier);
});


class AuthNotifier extends StateNotifier<AuthState> {
  final UserRepository repository;
  final GlobalMessageNotifier globalMessageNotifier;
  AuthNotifier({
    required this.repository,
    required this.globalMessageNotifier,
  }): super(AuthState());

  Future<void> login() async {
    try {
      final user = await repository.login();
      _setLoggerUser(user);
    } on CustomError catch (e) {
      globalMessageNotifier.setErrorMessage(e.message ?? 'Error no controlado');
    }
  }

  _setLoggerUser(User user){
    state = state.copyWith(user: user);
  }

}



// estado separado, para luego agregar authstatus
class AuthState {

  final User? user;

  AuthState({this.user});

  AuthState copyWith({
    User? user,
  }) => AuthState(
      user: user ?? this.user,
    );
}
