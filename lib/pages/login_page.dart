import 'package:flutter/material.dart';
import '../constant.dart';
import '../widgets/daftar_button.dart';
import '../widgets/password_textfield.dart';
import '../widgets/username_textfield.dart';
// import 'home_page.dart';
import 'menu_page_todo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = true;

  // text editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user up method
  // void signUserUp() async {
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //     email: emailController.text,
  //     password: passwordController.text,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    Size ukuran = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: biru,
      body: Stack(
        children: [
          Container(
            width: ukuran.width,
            height: ukuran.height,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const SizedBox(width: 40),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'ga wajib sih,\nmau daftar dulu?',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: putih),
                    ),
                  ),
                  const SizedBox(height: 25),

                  // email textfield
                  UsernameTextField(
                    controller: emailController,
                    hintText: 'Eg@gmail.com',
                    obscureText: false,
                  ),

                  const SizedBox(height: 20),

                  // password textfield
                  PasswordTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    // obscureText: true,
                  ),
                  const SizedBox(height: 25),

                  // daftar button
                  const DaftarButton(
                      // onTap: signUserUp,
                      ),
                  const SizedBox(height: 25),

                  // langsung masuk HomePage
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            color: putih,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'atau',
                            style: TextStyle(
                              fontSize: 16,
                              color: putih,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            color: putih,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // textbutton ke MenuPageTodo
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const MenuPageTodo();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      'langsung masuk aja!',
                      style: TextStyle(
                        fontSize: 16,
                        color: putih,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
