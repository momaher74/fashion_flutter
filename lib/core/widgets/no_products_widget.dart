import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class EmptyStateWidget extends StatefulWidget {
  final IconData? icon;
  final String title;
  final String? subtitle;
  final double iconSize;
  final Color iconColor;
  final Color iconBackgroundColor;
  final Color titleColor;
  final Color subtitleColor;
  final Duration animationDuration;

  const EmptyStateWidget({
    super.key,
    this.icon,
    this.title = "There is no products",
    this.subtitle,
    this.iconSize = 64,
    this.iconColor = Colors.white,
    this.iconBackgroundColor = const Color(0xff000000),
    this.titleColor = Colors.black,
    this.subtitleColor = Colors.black54,
    this.animationDuration = const Duration(milliseconds: 700),
  });

  @override
  State<EmptyStateWidget> createState() => _EmptyStateWidgetState();
}

class _EmptyStateWidgetState extends State<EmptyStateWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _scale = Tween<double>(begin: 0.85, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: _fade,
        child: ScaleTransition(
          scale: _scale,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: widget.iconBackgroundColor,
                  shape: BoxShape.circle,
                ),
                child: Swing(
                  animate: true,
                  infinite: true,
                  child: Icon(
                    widget.icon ?? PhosphorIcons.shirtFolded(),
                    size: widget.iconSize,
                    color: widget.iconColor,
                  ),
                ),
              ),
              const Gap(30),
              FadeInUpBig(
                delay: Duration(
                  milliseconds: 800
                ),
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: widget.titleColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              if (widget.subtitle != null) ...[
                const Gap(6),
                Text(
                  widget.subtitle!,
                  style: TextStyle(
                    fontSize: 13,
                    color: widget.subtitleColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
