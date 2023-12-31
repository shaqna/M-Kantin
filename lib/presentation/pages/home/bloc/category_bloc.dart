import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<OnCategoryChange>((event, emit) {
      emit(CurrentCategory());
    });

    on<OnCategoryInitial>((event, emit) {
      emit(CategoryInitial());
    });
  }
}
