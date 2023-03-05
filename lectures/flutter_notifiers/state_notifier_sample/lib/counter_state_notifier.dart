import 'package:state_notifier/state_notifier.dart';

class CounterStateNotifier extends StateNotifier<int> {
  CounterStateNotifier(super.state);

  void incrementcount() {
    state++;
  }
}
