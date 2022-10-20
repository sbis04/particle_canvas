import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FlutterFlowIconButton extends StatefulWidget {
  const FlutterFlowIconButton({
    Key? key,
    required this.icon,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.buttonSize,
    this.fillColor,
    this.onPressed,
    this.showLoadingIndicator = false,
  }) : super(key: key);

  final Widget icon;
  final double? borderRadius;
  final double? buttonSize;
  final Color? fillColor;
  final Color? borderColor;
  final double? borderWidth;
  final bool showLoadingIndicator;
  final Function()? onPressed;

  @override
  State<FlutterFlowIconButton> createState() => _FlutterFlowIconButtonState();
}

class _FlutterFlowIconButtonState extends State<FlutterFlowIconButton> {
  bool loading = false;
  late double? iconSize;
  late Color? iconColor;

  @override
  void initState() {
    final isFontAwesome = widget.icon is FaIcon;
    if (isFontAwesome) {
      final icon = widget.icon as FaIcon;
      iconSize = icon.size;
      iconColor = icon.color;
    } else {
      final icon = widget.icon as Icon;
      iconSize = icon.size;
      iconColor = icon.color;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: widget.borderRadius != null
          ? BorderRadius.circular(widget.borderRadius!)
          : null,
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: Ink(
        width: widget.buttonSize,
        height: widget.buttonSize,
        decoration: BoxDecoration(
          color: widget.fillColor,
          border: Border.all(
            color: widget.borderColor ?? Colors.transparent,
            width: widget.borderWidth ?? 0,
          ),
          borderRadius: widget.borderRadius != null
              ? BorderRadius.circular(widget.borderRadius!)
              : null,
        ),
        child: (widget.showLoadingIndicator && loading)
            ? Center(
                child: Container(
                  width: iconSize,
                  height: iconSize,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      iconColor ?? Colors.white,
                    ),
                  ),
                ),
              )
            : IconButton(
                icon: widget.icon,
                onPressed: widget.onPressed == null
                    ? null
                    : () async {
                        if (loading) {
                          return;
                        }
                        setState(() => loading = true);
                        try {
                          await widget.onPressed!();
                        } finally {
                          if (mounted) {
                            setState(() => loading = false);
                          }
                        }
                      },
                splashRadius: widget.buttonSize,
              ),
      ),
    );
  }
}
