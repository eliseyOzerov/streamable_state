part of '../streamable.dart';

extension StreamableStringExtension on Streamable<String> {
  String operator +(String other) {
    return value + other;
  }
}
