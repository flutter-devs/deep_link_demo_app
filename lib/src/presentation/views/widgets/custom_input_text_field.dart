import 'package:flutter/material.dart';

import '../../../core/constants/constant_imports.dart';

class CustomInputTextField extends StatelessWidget {
  const CustomInputTextField(
      {Key? key,
      this.controller,
      this.hintText,
      this.obSecureText = false,
      this.inputType = TextInputType.text})
      : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final bool? obSecureText;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hintText!,
          style: AppTextStyles.semiBoldText(fontSize: Dimensions.px15),
        ),
        TextFormField(
          obscureText: obSecureText!,
          controller: controller,
          keyboardType: inputType,
          style: AppTextStyles.semiBoldText(fontSize: Dimensions.px15),
          decoration: InputDecoration(
            hintText: 'Type here',
            hintStyle: AppTextStyles.semiBoldText(fontSize: Dimensions.px15),
            labelStyle: AppTextStyles.semiBoldText(fontSize: Dimensions.px15),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
