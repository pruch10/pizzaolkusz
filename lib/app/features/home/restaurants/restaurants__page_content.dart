import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/restaurants_cubit.dart';

class RestaurantPageContent extends StatelessWidget {
  const RestaurantPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestaurantsCubit()..start(),
      child: BlocBuilder<RestaurantsCubit, RestaurantsState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            return Center(
              child: Text('Sth went wrong: ${state.errorMessage}'),
            );
          }
          if (state.isLoading) {
            return const Center(
              child: (CircularProgressIndicator()),
            );
          }

          final documents = state.documents;

          return ListView(
            children: [
              for (final document in documents) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(document['name']),
                          Text(document['pizza']),
                          const SizedBox(
                            height: 20,
                          ),
                        ]),
                    Text(document['rating'].toString()),
                  ],
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
