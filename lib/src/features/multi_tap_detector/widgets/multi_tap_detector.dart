import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MultiTapDetector extends StatelessWidget {
  const MultiTapDetector({
    super.key,
    required this.onMultiTap,
    required this.taps,
    required this.child,
  });

  final VoidCallback onMultiTap;
  final int taps;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: {
        SerialTapGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<SerialTapGestureRecognizer>(
          () => SerialTapGestureRecognizer(),
          (SerialTapGestureRecognizer instance) {
            instance.onSerialTapDown = (SerialTapDownDetails details) {
              if (details.count == taps) {
                onMultiTap();
              }
            };
          },
        ),
      },
      child: child,
    );
  }
}
