import 'package:deep_link_demo_app/src/presentation/views/screens/show_api_data_screen.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constant_imports.dart';
import '../../../core/helper/common_toast.dart';
import '../../../core/helper/helper_imports.dart';
import '../widgets/custom_input_text_field.dart';
import '../widgets/custom_login_button.dart';
import 'home_screen.dart';
import 'user_signup_screen.dart';

class UserLoginScreen extends StatefulWidget {
  const UserLoginScreen({Key? key}) : super(key: key);

  @override
  _UserLoginScreenState createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  String? email;
  String? password;
  TextEditingController? _emailController, _passwordController;

  _handleDeepLinks() async {
    final PendingDynamicLinkData? initialLink =
        await FirebaseDynamicLinks.instance.getInitialLink();
    if (initialLink != null) {
      final Uri deepLink = initialLink.link;
      print('Deeplinks uri:${deepLink.path}');
      if (deepLink.path == '/ShowApiDataScreen') {
        AppRoute.nextPage(
            context,
            ShowApiDataScreen(
              deepLinkPath: '${deepLink.path}:Deep Link',
            ));
      } else if (deepLink.path == '/GoogleMapScreen') {
        AppRoute.nextPage(
            context,
            GoogleMapScreen(
              deepLinkPath: '${deepLink.path}:Deep Link',
            ));
      } else if (deepLink.path == '/UserSignUpScreen') {
        AppRoute.nextPage(
            context,
            UserSignUpScreen(
              deeplinkPath: '${deepLink.path}:Deep Link',
            ));
      }
    }
  }

  _onTapLoginBtn() async {
    AppHelper.dismissKeyboard(ctx: context);
    AppRoute.nextPage(context, const GoogleMapScreen());
  }

  _onTapSignupBtn() {
    AppHelper.dismissKeyboard(ctx: context);
    AppRoute.nextPage(context, const UserSignUpScreen());
  }

  @override
  void initState() {
    _handleDeepLinks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.login),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: true,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: PaddingConstants.screen,
            child: Column(
              children: [
                SizeHelper.h4(),
                CustomInputTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  inputType: TextInputType.emailAddress,
                ),
                SizeHelper.h2(),
                CustomInputTextField(
                  obSecureText: true,
                  controller: _passwordController,
                  hintText: 'Password',
                  inputType: TextInputType.emailAddress,
                ),
                SizeHelper.h3(),
                CustomButtonLogin(
                  label: 'Login',
                  borderColor: ColorConstants.blue,
                  bgColor: ColorConstants.blue,
                  lblStyle:
                      AppTextStyles.semiBoldText(fontSize: Dimensions.px16),
                  onTap: _onTapLoginBtn,
                ),
                SizeHelper.h3(),
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
          )
        ],
      ),
    );
  }

  bool checkForNonEmpty() {
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
    _emailController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }
}
