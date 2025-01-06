import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_user_technical/popular/presentation/bloc/user_detail_event.dart';
import 'package:github_user_technical/popular/presentation/bloc/user_detail_state.dart';
import '../../domain/usecases/get_detail_user_usecase.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  final GetUserDetailUseCase getUserDetailUseCase;

  UserDetailBloc(this.getUserDetailUseCase) : super(UserDetailInitial()) {
    on<FetchUserDetailEvent>(_onFetchUserDetail);
  }

  Future<void> _onFetchUserDetail(FetchUserDetailEvent event, Emitter<UserDetailState> emit) async {
    emit(UserDetailLoading());
    try {
      final userDetail = await getUserDetailUseCase(event.username, forceRefresh: true);
      emit(UserDetailLoaded(userDetail));
    } catch (error) {
      log('Error fetching user detail: $error', name: 'UserDetailBloc');
      emit(const UserDetailError('Failed to fetch user detail.'));
    }
  }
}
