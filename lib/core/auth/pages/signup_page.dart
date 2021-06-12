import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mvp_assessement/core/auth/widgets/auth_page_title_widget.dart';
import 'package:mvp_assessement/core/auth/widgets/logo_widget.dart';
import 'package:mvp_assessement/widgets/custom_elevated_button_widget.dart';
import 'package:mvp_assessement/widgets/custom_spacer_widget.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
                    child: Form(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LogoWidget(
                                width: 170,
                                height: 50,
                                alignment: Alignment.centerLeft,
                              ),
                              IconButton(
                                onPressed: () => Modular.to.pop(),
                                icon: Icon(PhosphorIcons.xLight),
                              ),
                            ],
                          ),
                          CustomSpacer(
                            flex: 2,
                            minHeight: 20,
                          ),
                          AuthPageTitleWidget(
                            title: 'Create an account',
                          ),
                          CustomSpacer(
                            flex: 2,
                            minHeight: 20,
                          ),
                          _UsernameTextFieldWidget(),
                          SizedBox(height: 20),
                          _EmailTextFieldWidget(),
                          SizedBox(height: 20),
                          _PasswordTextFieldWidget(),
                          _TermAndConditionWidget(),
                          CustomSpacer(flex: 3, minHeight: 30),
                          CustomElevatedButtonWidget(
                            onPressed: () {},
                            label: 'SIGNUP',
                            icon: PhosphorIcons.arrowRightLight,
                          ),
                          SizedBox(height: 20),
                          _SigninButtonWidget(),
                          CustomSpacer(
                            flex: 3,
                            minHeight: 30,
                          ),
                        ],
                      ),
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

class _UsernameTextFieldWidget extends StatelessWidget {
  const _UsernameTextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Username'),
    );
  }
}

class _EmailTextFieldWidget extends StatelessWidget {
  const _EmailTextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
    );
  }
}

class _PasswordTextFieldWidget extends StatelessWidget {
  const _PasswordTextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: Icon(PhosphorIcons.eyeLight),
      ),
      obscureText: true,
    );
  }
}

class _TermAndConditionWidget extends StatefulWidget {
  const _TermAndConditionWidget({Key? key}) : super(key: key);

  @override
  __TermAndConditionWidgetState createState() =>
      __TermAndConditionWidgetState();
}

class __TermAndConditionWidgetState extends State<_TermAndConditionWidget> {
  bool? _checkTermAndConditionButton = false;

  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);
    return Row(
      children: [
        Checkbox(
          value: _checkTermAndConditionButton,
          onChanged: (value) {
            setState(() {
              _checkTermAndConditionButton = value;
              print(_checkTermAndConditionButton);
            });
          },
        ),
        Text(
          'I agree your term & conditions',
          style: _themeData.textTheme.caption?.copyWith(
            color: Color(0xFF1D1C39),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _SigninButtonWidget extends StatelessWidget {
  const _SigninButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);
    return RichText(
      text: TextSpan(
        text: "Already have an account? ",
        style: _themeData.textTheme.button?.copyWith(
          color: _themeData.primaryColor,
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () => Modular.to.pop(),
            text: "Sign In",
            style: _themeData.textTheme.button?.copyWith(
              color: _themeData.accentColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
