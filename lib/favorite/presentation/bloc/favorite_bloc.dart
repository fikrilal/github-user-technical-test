import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/add_favorite_usecase.dart';
import '../../domain/usecase/get_favorite_usecase.dart';
import '../../domain/usecase/remove_favorite_usecase.dart';
import 'favorite_event.dart';
import 'favorite_state.dart';

class RemoveFavoriteEvent extends FavoriteEvent {
  final int id;

  const RemoveFavoriteEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class LoadFavoritesEvent extends FavoriteEvent {}

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final AddFavoriteUseCase addFavoriteUseCase;
  final RemoveFavoriteUseCase removeFavoriteUseCase;
  final GetFavoritesUseCase getFavoritesUseCase;

  FavoriteBloc({
    required this.addFavoriteUseCase,
    required this.removeFavoriteUseCase,
    required this.getFavoritesUseCase,
  }) : super(FavoriteInitial()) {
    on<AddFavoriteEvent>(_onAddFavorite);
    on<RemoveFavoriteEvent>(_onRemoveFavorite);
    on<LoadFavoritesEvent>(_onLoadFavorites);
  }

  Future<void> _onAddFavorite(AddFavoriteEvent event, Emitter<FavoriteState> emit) async {
    try {
      emit(FavoriteLoading());
      await addFavoriteUseCase(event.user);
      add(LoadFavoritesEvent());
    } catch (e) {
      emit(const FavoriteError('Failed to add favorite'));
    }
  }

  Future<void> _onRemoveFavorite(RemoveFavoriteEvent event, Emitter<FavoriteState> emit) async {
    try {
      emit(FavoriteLoading());
      await removeFavoriteUseCase(event.id);
      add(LoadFavoritesEvent());
    } catch (e) {
      emit(const FavoriteError('Failed to remove favorite'));
    }
  }

  Future<void> _onLoadFavorites(LoadFavoritesEvent event, Emitter<FavoriteState> emit) async {
    try {
      emit(FavoriteLoading());
      final favorites = await getFavoritesUseCase();
      emit(FavoriteLoaded(favorites));
    } catch (e) {
      emit(const FavoriteError('Failed to load favorites'));
    }
  }
}
