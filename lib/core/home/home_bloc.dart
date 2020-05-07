import 'package:bloc/bloc.dart';

import 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, String> {
  @override
  String get initialState => '';

  @override
  Stream<String> mapEventToState(HomeEvent event) async* {
    if (event is HomeSectionUpdated) {
      yield event.section;
    }
  }
}
