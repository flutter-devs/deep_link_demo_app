import 'package:flutter/material.dart';

import '../../../core/constants/constant_imports.dart';
import '../../../core/helper/common_toast.dart';
import '../../../core/helper/helper_imports.dart';
import '../widgets/custom_input_text_field.dart';
import '../widgets/custom_login_button.dart';

class UserSignUpScreen extends StatefulWidget {
  const UserSignUpScreen({this.deeplinkPath = 'User Signup Screen', Key? key})
      : super(key: key);
  final String deeplinkPath;

  @override
  _UserSignUpScreenState createState() => _UserSignUpScreenState();
}

class _UserSignUpScreenState extends State<UserSignUpScreen> {
  TextEditingController? _emailController,
      _phoneController,
      _nameController,
      _passwordController;

  void _initializeControllers() {
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  _onTapSignupBtn() async {
    if (checkForNonEmpty()) {
      AppHelper.dismissKeyboard(ctx: context);
      await _setUserInfoInSharedPref();
      AppRoute.pop(context);
    }
  }

  _setUserInfoInSharedPref() async {
    await SharedPrefHelper()
        .setString('name', _nameController?.text.toString());
    await SharedPrefHelper()
        .setString('email', _emailController?.text.toString());
    await SharedPrefHelper()
        .setString("password", _passwordController?.text.toString());
    await SharedPrefHelper()
        .setString("number", _phoneController?.text.toString());
  }

  @override
  void initState() {
    _initializeControllers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.deeplinkPath),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizeHelper.h3(),
                CustomInputTextField(
                  controller: _nameController,
                  hintText: 'Name',
                ),
                SizeHelper.h2(),
                CustomInputTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  inputType: TextInputType.text,
                ),
                SizeHelper.h2(),
                CustomInputTextField(
                  controller: _passwordController,
                  obSecureText: true,
                  hintText: 'Password',
                  inputType: TextInputType.text,
                ),
                SizeHelper.h2(),
                CustomInputTextField(
                  controller: _phoneController,
                  hintText: 'Number',
                  inputType: TextInputType.number,
                ),
                SizeHelper.h2(),
                CustomButtonLogin(
                  label: 'Sign Up',
                  borderColor: ColorConstants.blue,
                  bgColor: ColorConstants.blue,
                  lblStyle:
                      AppTextStyles.semiBoldText(fontSize: Dimensions.px16),
                  onTap: _onTapSignupBtn,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool checkForNonEmpty() {
    if (_nameController!.text.isEmpty) {
      showNotification(context,
          message: 'Please input your name', title: 'Error');
      return false;
    }
    if (_phoneController!.text.isEmpty) {
      showNotification(context,
          message: 'Please input your Phone Number', title: 'Error');
      return false;
    }
    if (_emailController!.text.isEmpty) {
      showNotification(context,
          message: 'Please input your email', title: 'Error');
      return false;
    }
    if (_passwordController!.text.isEmpty) {
      showNotification(context,
          message: 'Please input Password', title: 'Error');
      return false;
    }
    if (_passwordController!.text.trim().length < 6) {
      showNotification(context,
          message: 'Password must be 6 digit', title: 'Error');
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    _nameController?.dispose();
    _phoneController?.dispose();
    _emailController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }
}
