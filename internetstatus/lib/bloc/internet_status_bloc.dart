import 'dart:async';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';

part 'internet_status_event.dart';
part 'internet_status_state.dart';

class InternetStatusBloc
    extends Bloc<InternetStatusEvent, InternetStatusState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetStatusBloc() : super(InternetStatusInitialState()) {
    on<InternetStatusLostEvent>((event, emit) {
      emit(InternetStatusLosstState());
    });

    on<InternetStatusGainedEvent>((event, emit) {
      emit(InternetStatusGainedState());
    });

    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetStatusGainedEvent());
      } else {
        add(InternetStatusLostEvent());
      }
    });
  }
  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
