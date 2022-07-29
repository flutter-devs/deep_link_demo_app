import 'package:flutter/material.dart';

import '../../../core/constants/constant_imports.dart';

class CustomButtonLogin extends StatefulWidget {
  const CustomButtonLogin({
    Key? key,
    this.label,
    this.onTap,
    this.bgColor,
    this.lblStyle,
    this.borderColor,
    this.padding,
  }) : super(key: key);

  final String? label;
  final VoidCallback? onTap;
  final Color? bgColor;
  final TextStyle? lblStyle;
  final EdgeInsets? padding;
  final Color? borderColor;

  @override
  _CustomButtonLoginState createState() => _CustomButtonLoginState();
}

class _CustomButtonLoginState extends State<CustomButtonLogin> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: Dimensions.px50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.px40),
            color: widget.bgColor ?? Colors.white,
            border: widget.borderColor != null
                ? Border.all(color: widget.borderColor!, width: 2)
                : null,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 6.0,
                  offset: Offset(0, 3))
            ]),
        child: Center(
          child: SizedBox(
            width: 241,
            child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.label ?? 'Label',
                    style: widget.lblStyle ??
                        AppTextStyles.semiBoldText(fontSize: Dimensions.px15),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
