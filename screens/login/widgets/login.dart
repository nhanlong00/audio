import 'package:firestore/import.dart';
import 'package:firestore/screens/login/controller.dart';
import 'package:firestore/widgets/input/input_base.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final formLogin = GlobalKey<FormState>();

    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Đăng nhập', style: textSize28Bold),
                h(32),
                Form(
                  key: formLogin,
                  child: Column(
                    children: [
                      InputForm(
                        style: textSize16,
                        label: 'Tài khoản',
                        hintText: '',
                        onSaved: (value) {
                          controller.email = value;
                        },
                      ),
                      h(24),
                      InputForm(
                        style: textSize16,
                        label: 'Mật khẩu',
                        onSaved: (value) {
                          controller.password = value;
                        },
                        obscureText: controller.obscureText,
                        suffixIcon: InkWell(
                          onTap: () {
                            controller.obscureText = !controller.obscureText;
                            controller.update();
                          },
                          child: Icon(
                            controller.obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                      h(34),
                      ButtonPrimary(
                        onPress: () {
                          if (formLogin.currentState!.validate()) {
                            formLogin.currentState!.save();
                            AuthenticationHelper().signIn(
                              email: controller.email!,
                              password: controller.password!,
                            ).then((value) {
                                if (value == null) {
                                    Get.toNamed('/homepage');
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        value,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  );
                                }
                              },
                            );
                          }
                        },
                        title: 'Đăng nhập',
                        marginHoriontal: 0,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
