part of 'restaurants_cubit.dart';

class RestaurantsState {
  List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;

  RestaurantsState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
