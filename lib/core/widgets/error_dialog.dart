import 'package:fashion_flutter/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BeautyErrorDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onRetry;

  const BeautyErrorDialog({
    super.key,
    this.title = 'Oops!',
    required this.message,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color:Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon Circle
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red.withOpacity(0.1),
                ),
                child: const Icon(
                  Icons.error_outline_rounded,
                  color: Colors.red,
                  size: 40,
                ),
              ),

              const SizedBox(height: 16),

              // Message
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                    fontSize: 16,
                  ),
                ),
              

              const SizedBox(height: 24),


                 PrimaryButton(title: "Okay", onTap: () {
                  context.pop();
                }),

            ],
          ),
        ),
      ),
    );
  }
}


void showError({
  required BuildContext context,
  required String message,
  VoidCallback? onRetry,
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Error',
    barrierColor: Colors.black.withOpacity(0.4),
    transitionDuration: const Duration(milliseconds: 350),
    pageBuilder: (_, __, ___) {
      return BeautyErrorDialog(
        message: message,
        onRetry: onRetry,
      );
    },
    transitionBuilder: (_, animation, __, child) {
      final curvedValue = Curves.easeOutBack.transform(animation.value) - 1.0;
      return Transform(
        transform: Matrix4.translationValues(0, curvedValue * -50, 0)
          ..scale(animation.value),
        child: Opacity(
          opacity: animation.value,
          child: child,
        ),
      );
    },
  );
}
