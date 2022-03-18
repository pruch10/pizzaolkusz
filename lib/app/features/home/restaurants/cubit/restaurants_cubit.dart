import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'restaurants_state.dart';

class RestaurantsCubit extends Cubit<RestaurantsState> {
  RestaurantsCubit()
      : super(
          RestaurantsState(
            documents: const [],
            isLoading: false,
            errorMessage: '',
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      RestaurantsState(
        documents: const [],
        isLoading: false,
        errorMessage: '',
      ),
    );
    _streamSubscription = FirebaseFirestore.instance
        .collection('restaurants')
        .orderBy('rating')
        .snapshots()
        .listen((data) {
      emit(
        RestaurantsState(
            documents: data.docs, isLoading: false, errorMessage: ''),
      );
    })
      ..onError((error) {
        emit(
          RestaurantsState(
            documents: const [],
            isLoading: false,
            errorMessage: toString(),
          ),
        );
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
