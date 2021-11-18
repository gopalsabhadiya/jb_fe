import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/backend_integration/dto/register.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/sign_in.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/inputs/text_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RegisterForm();
  }
}

class _RegisterForm extends State<RegisterForm> {
  bool _obscurePassword = true;
  IconData _suffixPasswordVisible = Icons.visibility;
  RegisterFormDTO registerFormDTO = RegisterFormDTO();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Column(
        children: [
          AppTextInput(
              onChanged: registerFormDTO.setName,
              prefixIcon: Icons.person_outline,
              hint: SignInText.REGISTER_USERNAME_HINT),
          const SizedBox(
            height: 20,
          ),
          AppTextInput(
              onChanged: registerFormDTO.setEmail,
              prefixIcon: Icons.email_outlined,
              hint: SignInText.SIGN_IN_EMAIL_HINT),
          const SizedBox(
            height: 20,
          ),
          AppTextInput(
            onChanged: registerFormDTO.setPassword,
            prefixIcon: Icons.lock_outline,
            hint: SignInText.SIGN_IN_PASSWORD_HINT,
            suffixIcon: _suffixPasswordVisible,
            obscureText: _obscurePassword,
            suffixIconClickHandler: _showHidePassword,
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            child: _getRegisterButton(),
            onTap: () {
              print("Register: ${registerFormDTO.toString()}");
            },
          )
        ],
      ),
    );
  }

  void _showHidePassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;
      _suffixPasswordVisible =
          _obscurePassword ? Icons.visibility : Icons.visibility_off;
    });
  }

  Widget _getRegisterButton() {
    return Container(
      decoration: const ShapeDecoration(
        color: AppColors.blue_5,
        shape: StadiumBorder(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.app_registration,
            color: AppColors.grey_1,
            size: 25,
          ),
          const SizedBox(
            width: 20,
          ),
          AppTextBuilder(SignInText.REGISTER)
              .paddingVertical(15)
              .color(AppColors.grey_1)
              .build(),
        ],
      ),
    );
  }
}
