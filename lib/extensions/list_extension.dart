part of '../streamable.dart';

extension StreamableListExtension<T> on Streamable<List<T>> {
  T? operator [](int index) {
    return value[index];
  }

  void operator []=(int index, T newVal) {
    value[index] = newVal;
  }
}
