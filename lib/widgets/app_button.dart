import 'package:flutter/material.dart';
import 'package:mini_store/widgets/app_gradient_button.dart';

class AppButton extends StatefulWidget {
  final Size size;
  final String text;
  final IconData icon;
  final IconData? endIcon;
  final VoidCallback onPressed;
  const AppButton({
    super.key,
    required this.size,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.endIcon,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool isBig=false;
  bool isAnimating=false;
  @override
  Widget build(BuildContext context) {
    final ColorScheme theme=Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        gradient: AppGradientButton.primaryButton,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(
          color: theme.primary.withValues(alpha: 0.3),
          offset: Offset(0, 4),
          blurRadius: 12,
        )],
      ),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 50),
        width:isBig?widget.size.width+5:widget.size.width,
        height:isBig? widget.size.height+5:widget.size.height,
        child: ElevatedButton(
          
          style: ElevatedButton.styleFrom(
            minimumSize: widget.size,
            foregroundColor: theme.onPrimary,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () async{
            if (isAnimating) return;
            
             isAnimating=true;

            setState(() {
              isBig=!isBig;
            });
            await Future.delayed(Duration(milliseconds: 100));
            setState(() {
              isBig=!isBig;
            });
             await Future.delayed(Duration(milliseconds: 100));
             
             isAnimating=false;

            widget.onPressed();
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon),
              const SizedBox(width: 6),
              Text(widget.text, style: Theme.of(context).textTheme.labelMedium),
              const SizedBox(width: 6),
              if (widget.endIcon != null) Icon(widget.endIcon),
            ],
          ),
        ),
      ),
    );
  }
}
