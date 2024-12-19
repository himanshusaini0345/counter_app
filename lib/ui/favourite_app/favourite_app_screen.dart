import 'package:counter_app/bloc/favourite_app/favourite_app_bloc.dart';
import 'package:counter_app/models/favourite_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteAppScreen extends StatefulWidget {
  const FavouriteAppScreen({super.key});

  @override
  State<FavouriteAppScreen> createState() => _FavouriteAppScreenState();
}

class _FavouriteAppScreenState extends State<FavouriteAppScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavouriteAppBloc>().add(FetchFavouriteListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<FavouriteAppBloc, FavouriteAppState>(
            builder: (context, state) {
          switch (state.listStatus) {
            case ListStatus.loading:
              return Center(child: CircularProgressIndicator());
            case ListStatus.failure:
              return Text('Something went wrong');
            case ListStatus.success:
              return ListView.builder(
                  itemCount: state.favouriteItemList.length,
                  itemBuilder: (context, index) {
                    final item = state.favouriteItemList[index];
                    return Card(
                      child: ListTile(
                        title: Text(item.value),
                        trailing: IconButton(
                          icon: item.isFavourite
                              ? Icon(Icons.favorite)
                              : Icon(Icons.favorite_outline),
                          onPressed: () {
                            FavouriteItemModel favouriteItemModel =
                                FavouriteItemModel(
                                    id: item.id,
                                    value: item.value,
                                    isFavourite:
                                        item.isFavourite ? false : true);
                            context.read<FavouriteAppBloc>().add(
                                AddFavouriteItemEvent(
                                    item: favouriteItemModel));
                          },
                        ),
                      ),
                    );
                  });
          }
        }),
      ),
    );
  }
}
