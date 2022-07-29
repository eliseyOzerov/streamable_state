part of '../streamable.dart';

extension StreamableMapExtension<K, V> on Streamable<Map<K, V>> {
  V? operator [](K key) {
    return value[key];
  }

  void operator []=(K key, V newVal) {
    value[key] = newVal;
  }
}
