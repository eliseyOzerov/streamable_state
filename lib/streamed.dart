part of 'streamable.dart';

/// The widget consuming a streamable and a builder
/// to build the streamed value.
class Streamed<T> extends StatefulWidget {
  /// Default constructor
  const Streamed({
    required this.streamable,
    required this.builder,
    Key? key,
  }) : super(key: key);

  /// The streamable to build from
  final Streamable<T> streamable;

  /// The builder to build with
  final Widget Function(T?) builder;

  @override
  State<Streamed<T>> createState() => _StreamedState<T>();
}

class _StreamedState<T> extends State<Streamed<T>> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T?>(
      stream: widget.streamable.stream,
      initialData: widget.streamable.value,
      builder: (context, snapshot) {
        return widget.builder(snapshot.data);
      },
    );
  }
}
