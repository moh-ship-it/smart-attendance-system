import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainBottomNavigationbarNotifier extends Notifier<int> {
  @override
  int build() {
    return 0; //current index
  }

  void setIndex(int index) {
    if (state != index) {
      state = index;
    }
  }
}

final bottomProvider = NotifierProvider<MainBottomNavigationbarNotifier, int>(
  MainBottomNavigationbarNotifier.new,
);
