import 'package:flutter/material.dart';

class PremiumAnimatedDivider extends StatefulWidget {
  const PremiumAnimatedDivider({
    super.key,
    this.height = 2,
    this.indicatorWidth = 30,
  });

  final double height;
  final double indicatorWidth;

  @override
  State<PremiumAnimatedDivider> createState() =>
      _PremiumAnimatedDividerState();
}

class _PremiumAnimatedDividerState extends State<PremiumAnimatedDivider>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: widget.height + 8,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          /// 🔥 Animated black line (shimmer / flow)
          AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return Container(
                height: widget.height,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(-1 + _controller.value * 2, 0),
                    end: Alignment(1 + _controller.value * 2, 0),
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black,
                      Colors.black.withOpacity(0.3),
                    ],
                  ),
                ),
              );
            },
          ),

          /// ✨ Moving white indicator
          AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return Positioned(
                left: (screenWidth - widget.indicatorWidth) *
                    _controller.value,
                child: Container(
                  width: widget.indicatorWidth,
                  height: widget.height + 4,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
