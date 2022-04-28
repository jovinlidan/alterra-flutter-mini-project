import 'package:flutter/material.dart';
import 'package:mini_project/helpers/providers/form_manager.dart';
import 'package:mini_project/helpers/validator.dart';
import 'package:mini_project/widgets/auth_header.dart';
import 'package:mini_project/widgets/form.dart';
import 'package:mini_project/widgets/inputs/text_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  late final FormManager _formManager;

  bool isPasswordShow = false;
  bool isRepeatPasswordShow = false;

  @override
  void initState() {
    _formManager = FormManager();
    super.initState();
  }

  void clearText(TextEditingController tec, String key) {
    tec.clear();
    _formManager.setValueForField(key, '');
  }

  void onSubmit() {
    if (_formManager.erroredFields.length == 0) {
      print(_formManager.getValueForField('name'));
      print(_formManager.getValueForField('email'));
      print(_formManager.getValueForField('password'));
      print(_formManager.getValueForField('repeatPassword'));
    }
  }

  void onNavigateLogin() {
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AuthHeader(
                title: "Daftar",
                desc1: "Belajar coding dengan melakukannya",
                desc2: "Daftar Sekarang"),
            const SizedBox(height: 36),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: FormProvider(
                  changeNotifier: _formManager,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _formKey,
                  builder: (state) => Column(
                    children: [
                      TextInput(
                        name: "name",
                        prefixIcon: Icons.perm_identity,
                        suffixIcon: (state.getValueForField('name') != null &&
                                state.getValueForField('name')!.isNotEmpty
                            ? Icons.close
                            : null),
                        placeholder: "Masukkan nama anda",
                        label: "Nama",
                        validator: (String? val) => Validator.validate(
                          val,
                          [
                            Validator.required,
                            Validator.min5,
                          ],
                        ),
                        onSuffixIconPress: (tec) => clearText(tec, 'name'),
                      ),
                      const SizedBox(height: 12),
                      TextInput(
                        name: "email",
                        prefixIcon: Icons.alternate_email,
                        suffixIcon: (state.getValueForField('email') != null &&
                                state.getValueForField('email')!.isNotEmpty
                            ? Icons.close
                            : null),
                        placeholder: "Masukkan email anda",
                        label: "Email",
                        validator: (String? val) => Validator.validate(
                          val,
                          [
                            Validator.required,
                            Validator.email,
                          ],
                        ),
                        onSuffixIconPress: (tec) => clearText(tec, 'email'),
                      ),
                      const SizedBox(height: 12),
                      TextInput(
                          name: "password",
                          prefixIcon: Icons.lock_outline,
                          suffixIcon: isPasswordShow ? Icons.visibility : Icons.visibility_off,
                          placeholder: "Masukkan kata sandi anda",
                          label: "Kata Sandi",
                          obscureText: !isPasswordShow,
                          onSuffixIconPress: (_) =>
                              setState(() => isPasswordShow = !isPasswordShow),
                          validator: (String? val) {
                            if (state.getValueForField('password') !=
                                state.getValueForField('repeatPassword')) {
                              return "Kedua Password harus sama";
                            }
                            return Validator.validate(val, [Validator.min5]);
                          }),
                      const SizedBox(height: 12),
                      TextInput(
                          name: "repeatPassword",
                          prefixIcon: Icons.lock_outline,
                          suffixIcon:
                              isRepeatPasswordShow ? Icons.visibility : Icons.visibility_off,
                          placeholder: "Ulangi kata sandi anda",
                          label: "Ulang Kata Sandi",
                          obscureText: !isRepeatPasswordShow,
                          onSuffixIconPress: (_) =>
                              setState(() => isRepeatPasswordShow = !isRepeatPasswordShow),
                          validator: (String? val) {
                            if (state.getValueForField('password') !=
                                state.getValueForField('repeatPassword')) {
                              return "Kedua Password harus sama";
                            }
                            return Validator.validate(val, [Validator.min5]);
                          }),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: onSubmit,
                        child: const Text("Daftar"),
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all<Size>(const Size.fromHeight(40)),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue[700]!),
                        ),
                      ),
                      const SizedBox(height: 4),
                      TextButton(
                          onPressed: onNavigateLogin, child: const Text("Sudah Punya Akun? Masuk"))
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
