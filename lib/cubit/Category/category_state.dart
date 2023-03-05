part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}
class CategorySuccessState extends CategoryState {}
class CategoryFailureState extends CategoryState {}
class CategoryLoadingState extends CategoryState {}