import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mvp_assessement/core/auth/auth_module.dart';
import 'package:mvp_assessement/core/auth/controllers/auth_controller.dart';
import 'package:mvp_assessement/core/auth/widgets/auth_page_title_widget.dart';
import 'package:mvp_assessement/core/auth/widgets/logo_widget.dart';
import 'package:mvp_assessement/widgets/custom_divider_widget.dart';
import 'package:mvp_assessement/widgets/custom_elevated_button_widget.dart';
import 'package:mvp_assessement/widgets/custom_spacer_widget.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 10, right: 20.0, left: 20.0),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LogoWidget(
                          width: 170,
                          height: 50,
                          alignment: Alignment.centerLeft,
                        ),
                        CustomSpacer(
                          flex: 2,
                          minHeight: 20,
                        ),
                        AuthPageTitleWidget(
                          title: 'Sign in to your account',
                        ),
                        CustomSpacer(
                          flex: 1,
                          minHeight: 20,
                        ),
                        _EmailTextFieldWidget(),
                        SizedBox(height: 20),
                        _PasswordTextFieldWidget(),
                        _ForgetPasswordButtonWidget(),
                        CustomSpacer(
                          flex: 2,
                          minHeight: 20,
                        ),
                        CustomElevatedButtonWidget(
                          onPressed: () {},
                          label: 'SIGNIN',
                          icon: PhosphorIcons.arrowRightLight,
                        ),
                        CustomSpacer(
                          flex: 2,
                          minHeight: 20,
                        ),
                        _SigningWithSocialMediaDividerWidget(),
                        CustomSpacer(
                          flex: 1,
                          minHeight: 20,
                        ),
                        _SigninWithSocialMediaButtonsWidget(),
                        CustomSpacer(
                          flex: 1,
                          minHeight: 20,
                        ),
                        CustomDividerWidget(),
                        _CreateNewAccountButtonWidget(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialMediaOutlinedButtonWidget extends StatelessWidget {
  const _SocialMediaOutlinedButtonWidget({
    Key? key,
    required this.onPressed,
    this.label,
    this.width,
    required this.imagePath,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String? label;
  final String imagePath;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);
    return SizedBox(
      width: width,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (label != null)
              Text(
                label!,
                style: _themeData.textTheme.button?.copyWith(
                  color: _themeData.primaryColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            Image(
              image: AssetImage(imagePath),
              width: 24,
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}

class _EmailTextFieldWidget extends StatelessWidget {
  const _EmailTextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(labelText: 'Email'),
    );
  }
}

class _PasswordTextFieldWidget extends StatelessWidget {
  const _PasswordTextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: Icon(PhosphorIcons.eyeLight),
      ),
      obscureText: true,
    );
  }
}

class _ForgetPasswordButtonWidget extends StatelessWidget {
  const _ForgetPasswordButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => AuthModule.toForgotPasswordPage(),
        child: Text('Forgot password?'),
      ),
    );
  }
}

class _SigningWithSocialMediaDividerWidget extends StatelessWidget {
  const _SigningWithSocialMediaDividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'or sign in with your social account',
          style: _themeData.textTheme.caption?.copyWith(
            color: _themeData.primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 10),
        Expanded(child: Divider())
      ],
    );
  }
}

class _SigninWithSocialMediaButtonsWidget extends StatelessWidget {
  const _SigninWithSocialMediaButtonsWidget({Key? key}) : super(key: key);

  AuthController get _controller => Modular.get<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: _SocialMediaOutlinedButtonWidget(
            onPressed: () => _controller.signInWithGoogle(),
            label: 'Sign in with Google',
            imagePath: 'assets/images/social_media/google.png',
          ),
        ),
        SizedBox(width: 20),
        _SocialMediaOutlinedButtonWidget(
          onPressed: () => _controller.signInWithFacebook(),
          imagePath: 'assets/images/social_media/facebook.png',
        ),
      ],
    );
  }
}

class _CreateNewAccountButtonWidget extends StatelessWidget {
  const _CreateNewAccountButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextButton(
        onPressed: () => AuthModule.toSignupPage(),
        child: Text(
          'Create new account',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
