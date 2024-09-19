import 'dart:async';

import 'package:flutter/material.dart';

part 'extensions/double_extension.dart';
part 'extensions/int_extension.dart';
part 'extensions/list_extension.dart';
part 'extensions/map_extension.dart';
part 'extensions/string_extension.dart';
part 'streamed.dart';

/// The class representing a streamed value
class Streamable<T> {
  /// Default constructor
  Streamable(T defaultValue) {
    value = defaultValue;
  }

  /// The controller handling broadcasting of the value
  final _controller = StreamController<T>.broadcast();

  /// The stream of values to subscribe to
  Stream<T> get stream => _controller.stream;

  /// The latest value of the stream
  late T value;

  /// Sets the value to the given [val] and updates the listeners.
  void set(T val) {
    value = val;
    _controller.add(value);
  }

  /// Sends the current value to listeners
  void send() {
    _controller.add(value);
  }

  /// Utility wrapper for this.stream.listen
  StreamSubscription<T> listen(Function(T) listener) {
    return stream.listen(listener);
  }
}
