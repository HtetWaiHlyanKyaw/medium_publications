import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medium_publications/feature/cat/data/repo/cat_repo.dart';
import 'package:medium_publications/feature/cat/presentation/cubit/cat_state.dart';

class CatCubit extends Cubit<CatState> {
  final CatRepo _catRepo;

  CatCubit(this._catRepo) : super(CatInitial());

  Future<void> getCats() async {
    emit(CatLoading());
    try {
      final cats = await _catRepo.getCats();
      emit(CatLoaded(cats: cats));
    } catch (e) {
      emit(CatError(message: e.toString()));
    }
  }
}
