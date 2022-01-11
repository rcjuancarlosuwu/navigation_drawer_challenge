part of '../providers.dart';

class TopPanelHeight extends StateNotifier<double> {
  TopPanelHeight() : super(0.0);

  setHeight(GlobalKey globalKey) {
    final renderBox = globalKey.currentContext?.findRenderObject() as RenderBox;
    state = renderBox.localToGlobal(Offset.zero).dy;
  }
}
