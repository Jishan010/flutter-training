import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'connectioon_checker_event.dart';

part 'connectioon_checker_state.dart';

class ConnectioonCheckerBloc extends Bloc<ConnectionCheckerEvent, ConnectioonCheckerState> {
  StreamSubscription<ConnectivityResult>? subrciption;

  ConnectioonCheckerBloc() : super(ConnectioonCheckerInitialState()) {
    on<ConnectionObserveEvent>((event, emit) {
      subrciption =
          Connectivity().onConnectivityChanged.listen((ConnectivityResult connectivityResult) {
        if (connectivityResult == ConnectivityResult.mobile ||
            connectivityResult == ConnectivityResult.wifi) {
          add(ConnectionSuccessEvent());
        } else {
          add(ConnectionErrorEvent());
        }
      });
    });

    on<ConnectionSuccessEvent>((event, emit) {
      emit(ConnectionSuccessState());
    });

    on<ConnectionErrorEvent>((event, emit) {
      emit(ConnectionFailureState());
    });
  }

  @override
  Future<void> close() {
    if (subrciption != null) {
      subrciption?.cancel();
      subrciption = null;
    }
    return super.close();
  }
}
