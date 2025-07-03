
import 'package:flutter/material.dart';

enum ToastPosition { top, bottom }

/// Facebook-style lightweight toast utility
class CustomSnackBar {
  static bool _isVisible = false;

  static void show(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
    ToastPosition position = ToastPosition.bottom,
    Color backgroundColor = const Color(0xFFF0F2F5),
    Color textColor = Colors.black87,
    double fontSize = 14,
  }) {
    if (_isVisible) return;
    _isVisible = true;

    final overlay = Overlay.of(context);

    final overlayEntry = OverlayEntry(
      builder: (context) => _ToastWidget(
        message: message,
        position: position,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: fontSize,
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(duration, () {
      overlayEntry.remove();
      _isVisible = false;
    });
  }
}

class _ToastWidget extends StatefulWidget {
  final String message;
  final ToastPosition position;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;

  const _ToastWidget({
    required this.message,
    required this.position,
    required this.backgroundColor,
    required this.textColor,
    required this.fontSize,
  });

  @override
  State<_ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<_ToastWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Alignment get _alignment =>
      widget.position == ToastPosition.top ? Alignment.topCenter : Alignment.bottomCenter;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: IgnorePointer(
        child: SafeArea(
          child: Align(
            alignment: _alignment,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: widget.backgroundColor,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Text(
                    widget.message,
                    style: TextStyle(
                       decoration: TextDecoration.none,
                      color: widget.textColor,
                      fontSize: widget.fontSize,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}