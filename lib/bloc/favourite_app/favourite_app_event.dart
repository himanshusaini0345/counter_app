part of 'favourite_app_bloc.dart';

sealed class FavouriteAppEvent extends Equatable {
  const FavouriteAppEvent();
  @override
  List<Object?> get props => [];
}

class FetchFavouriteListEvent extends FavouriteAppEvent {}

class AddFavouriteItemEvent extends FavouriteAppEvent {
  final FavouriteItemModel item;
  const AddFavouriteItemEvent({required this.item});
}
