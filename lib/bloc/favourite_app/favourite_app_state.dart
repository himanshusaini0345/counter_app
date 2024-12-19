part of 'favourite_app_bloc.dart';

enum ListStatus {
  loading,
  success,
  failure,
}

class FavouriteAppState extends Equatable {
  final List<FavouriteItemModel> favouriteItemList;
  final ListStatus listStatus;

  const FavouriteAppState({
    this.favouriteItemList = const [],
    this.listStatus = ListStatus.loading,
  });

  FavouriteAppState copyWith(
      {List<FavouriteItemModel>? favouriteItemList, ListStatus? listStatus}) {
    return FavouriteAppState(
        favouriteItemList: favouriteItemList ?? this.favouriteItemList,
        listStatus: listStatus ?? this.listStatus);
  }

  @override
  List<Object> get props => [favouriteItemList, listStatus];
}
