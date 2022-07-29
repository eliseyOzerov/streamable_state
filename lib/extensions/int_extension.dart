part of '../streamable.dart';

extension StreamableIntExtension on Streamable<int> {
  /// Addition operator
  int operator +(int other) {
    return value + other;
  }

  /// Subtraction operator
  int operator -(int other) {
    return value - other;
  }

  /// Multiplication operator
  int operator *(int other) {
    return value * other;
  }

  /// Division operator
  double operator /(int other) {
    return value / other;
  }
}
