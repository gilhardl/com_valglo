import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeSectionUpdated extends HomeEvent {
  final String section;

  HomeSectionUpdated(this.section);

  @override
  List<Object> get props => [section];

  @override
  String toString() => 'HomeSectionUpdated { section: $section }';
}
