part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {}

class OnCategoryInitial extends CategoryEvent {}

class OnCategoryChange extends CategoryEvent{
  final int index;

  OnCategoryChange(this.index);
}