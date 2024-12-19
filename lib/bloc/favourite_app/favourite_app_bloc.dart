import 'package:bloc/bloc.dart';
import 'package:counter_app/models/favourite_item_model.dart';
import 'package:counter_app/repositories/favourite_repository.dart';
import 'package:equatable/equatable.dart';

part 'favourite_app_event.dart';
part 'favourite_app_state.dart';

class FavouriteAppBloc extends Bloc<FavouriteAppEvent, FavouriteAppState> {
  FavouriteRepository favouriteRepository;
  List<FavouriteItemModel> favouriteList = [];
  FavouriteAppBloc(this.favouriteRepository)
      : super(const FavouriteAppState()) {
    on<FetchFavouriteListEvent>((event, emit) async {
      favouriteList = await favouriteRepository.fetchItem();
      emit(state.copyWith(
          favouriteItemList: List.from(favouriteList),
          listStatus: ListStatus.success));
    });
    on<AddFavouriteItemEvent>((event, emit) async {
      final index =
          favouriteList.indexWhere((item) => item.id == event.item.id);
      favouriteList[index] = event.item;
      emit(state.copyWith(
          favouriteItemList: List.from(favouriteList),
          listStatus: ListStatus.success));
    });
  }
}
