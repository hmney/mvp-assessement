import 'package:flutter/material.dart';
import 'package:mvp_assessement/widgets/custom_divider_widget.dart';
import 'package:mvp_assessement/widgets/custom_elevated_button_widget.dart';
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
                        _CustomSpacer(
                          flex: 2,
                          minHeight: 20,
                        ),
                        _SignInTitleWidget(),
                        _CustomSpacer(
                          flex: 1,
                          minHeight: 20,
                        ),
                        _EmailTextFieldWidget(),
                        SizedBox(height: 20),
                        _PasswordTextFieldWidget(),
                        _ForgetPasswordButtonWidget(),
                        _CustomSpacer(
                          flex: 2,
                          minHeight: 20,
                        ),
                        CustomElevatedButtonWidget(
                          onPressed: () {},
                          label: 'SIGNIN',
                          icon: PhosphorIcons.arrowRightLight,
                        ),
                        _CustomSpacer(
                          flex: 2,
                          minHeight: 20,
                        ),
                        _SigningWithSocialMediaDividerWidget(),
                        _CustomSpacer(
                          flex: 1,
                          minHeight: 20,
                        ),
                        _SigninWithSocialMediaButtonsWidget(),
                        _CustomSpacer(
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

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
    required this.width,
    required this.height,
    this.alignment,
  }) : super(key: key);

  final double width;
  final double height;
  final AlignmentGeometry? alignment;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.center,
      child: Image(
        width: width,
        height: height,
        image: AssetImage('assets/images/logo.png'),
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

class _SignInTitleWidget extends StatelessWidget {
  const _SignInTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Sign in to your account',
        style: _themeData.textTheme.headline5?.copyWith(
          color: _themeData.accentColor,
          fontWeight: FontWeight.w600,
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
        onPressed: () {},
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

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: _SocialMediaOutlinedButtonWidget(
            onPressed: () {},
            label: 'Sign in with Google',
            imagePath: 'assets/images/social_media/google.png',
          ),
        ),
        SizedBox(width: 20),
        _SocialMediaOutlinedButtonWidget(
          onPressed: () {},
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
        onPressed: () {},
        child: Text(
          'Create new account',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}

class _CustomSpacer extends StatelessWidget {
  const _CustomSpacer({Key? key, required this.flex, required this.minHeight})
      : super(key: key);

  final int flex;
  final double minHeight;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: minHeight),
      ),
    );
  }
}
