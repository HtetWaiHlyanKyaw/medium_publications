import 'package:equatable/equatable.dart';
import 'package:medium_publications/feature/cat/domain/model/cat.dart';

abstract class CatState extends Equatable {
  const CatState();

  @override
  List<Object> get props => [];
}

class CatInitial extends CatState {}

class CatLoading extends CatState {}

class CatLoaded extends CatState {
  final List<Cat> cats;

  const CatLoaded({required this.cats});

  @override
  List<Object> get props => [cats];
}

class CatError extends CatState {
  final String message;

  const CatError({required this.message});

  @override
  List<Object> get props => [message];
}
