import 'package:flutter/material.dart';

class DoubleIconTextButton extends StatefulWidget {
  final Widget icon1;
  final Widget label;
  final Widget? icon2;
  final void Function()? onPressed;
  final bool expanded;
  final bool bordered;
  final Color bgColor;
  const DoubleIconTextButton({
    super.key, 
    required this.label, 
    required this.icon1, 
    this.icon2, 
    this.onPressed, 
    this.expanded = false, 
    this.bordered = false, 
    this.bgColor = Colors.white});

  @override
  State<DoubleIconTextButton> createState() => _DoubleIconTextButtonState();
}

class _DoubleIconTextButtonState extends State<DoubleIconTextButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: widget.bordered ? Border.all(color: Colors.red) : null,
          borderRadius: BorderRadius.circular(10),
          color: widget.bgColor
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [ 
              widget.icon1,
              const SizedBox(width: 10,),
              widget.expanded 
              ? Expanded(child: widget.label)
              : widget.label,
              const SizedBox(width: 10,),
              widget.icon2 ?? const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}