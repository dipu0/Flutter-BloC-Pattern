import 'package:counter/bloc/counter_event.dart';
import 'package:counter/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;

  CounterBloc() : super(CounterInit()) {
    on<CounterIncress>(
      (event, emit) {
        counter += 1;
        emit(CounterUpdate(counter));
      },
    );

    on<CounterDecress>(
      (event, emit) {
        counter -= 1;
        emit(CounterUpdate(counter));
      },
    );
  }
}
