

import 'package:flutter_riverpod/flutter_riverpod.dart';


final globalMessageProvider = StateNotifierProvider<GlobalMessageNotifier, GlobalMessageState>((ref) {
  return GlobalMessageNotifier();
});


class GlobalMessageNotifier extends StateNotifier<GlobalMessageState> {
  GlobalMessageNotifier(): super(GlobalMessageState());


  setErrorMessage(String errorMessage){
    state = state.copyWith(
      errorMessage: errorMessage,
      successMessage: ''
    );
  }
  
  setSuccessMessage(String successMessage){
    state = state.copyWith(
      successMessage: successMessage,
      errorMessage: ''
    );
  }

  Future<bool> checkErrorMessage(){
    return Future.value(state.errorMessage != '');
  }

  clearErrorMessage(){
    state = state.copyWith(
      errorMessage: null
    );
  }

  clearSuccessMessage(){
    state = state.copyWith(
      successMessage: null
    );
  }


}



class GlobalMessageState {
  final String errorMessage;
  final String successMessage;

  GlobalMessageState({
    this.errorMessage = '',
    this.successMessage = ''});

  GlobalMessageState copyWith({
    String? errorMessage,
    String? successMessage,
  }) => GlobalMessageState(
      errorMessage: errorMessage ?? this.errorMessage,
      successMessage: successMessage ?? this.successMessage,
    );
}
