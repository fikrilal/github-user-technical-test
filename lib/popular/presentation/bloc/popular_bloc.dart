import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_user_technical/popular/presentation/bloc/popular_event.dart';
import 'package:github_user_technical/popular/presentation/bloc/popular_state.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/get_user_usecase.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  final GetUsersUseCase getUsersUseCase;

  PopularBloc(this.getUsersUseCase) : super(PopularInitial()) {
    on<FetchUsersEvent>(_onFetchUsers);
  }

  Future<void> _onFetchUsers(
    FetchUsersEvent event,
    Emitter<PopularState> emit,
  ) async {
    emit(PopularLoading());

    try {
      log('Fetching users...', name: 'PopularBloc');
      final List<UserEntity> users = await getUsersUseCase(forceRefresh: event.forceRefresh);
      emit(PopularLoaded(users));
      log('Fetched ${users.length} users', name: 'PopularBloc');
    } catch (e) {
      log('Error fetching users: $e', name: 'PopularBloc', level: 3);
      emit(const PopularError('Failed to fetch users.'));
    }
  }
}
