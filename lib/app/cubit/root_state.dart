part of 'root_cubit.dart';

class RootState {
  final User? user;
  final bool isLoading;
  final String errorMessage;

  RootState({
    required this.isLoading,
    required this.errorMessage,
    required this.user,
  });
}
