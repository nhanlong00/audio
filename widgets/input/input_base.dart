import 'package:firestore/import.dart';

class InputForm extends StatelessWidget {
  const InputForm({
    super.key,
    this.hintText,
    this.label,
    this.style,
    this.suffixIcon,
    this.onSaved,
    this.obscureText,
    this.onChanged,
  });

  final String? hintText;
  final String? label;
  final TextStyle? style;
  final Widget? suffixIcon;
  final Function(dynamic)? onSaved;
  final Function(dynamic)? onChanged;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      decoration: otpInput.copyWith(
        suffixIcon: suffixIcon,
        hintText: hintText ?? '',
        label: Text(
          label ?? '',
          style: textSize18,
        ),
      ),
      style: style ?? textSize20.copyWith(color: kPrimaryLightColor),
      onSaved: onSaved,
      onChanged: onChanged,
    );
  }
}
