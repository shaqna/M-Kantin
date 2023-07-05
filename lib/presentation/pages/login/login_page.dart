import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mkantin/presentation/pages/login/bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.red,
            statusBarIconBrightness: Brightness.dark),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: width - 100, maxHeight: height - 200),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                padding: const EdgeInsets.all(32.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'm-Kantin',
                      style: GoogleFonts.poppins(
                        color: Colors.red,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      'Food Court\nMenara Satu Plaza',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Center(
                      child: SizedBox(
                        width: 120,
                        child: Text(
                          'Welcome to Modern Kantin',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14.0,
                              decoration: TextDecoration.underline),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      'Username',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Color.fromARGB(255, 218, 218, 218),
                        focusColor: Colors.red,
                      ),
                      cursorColor: Colors.red,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      'Password',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Color.fromARGB(255, 218, 218, 218),
                        focusColor: Colors.red,
                      ),
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.red,
                    ),
                    const SizedBox(
                      height: 14.0,
                    ),
                    BlocConsumer<LoginBloc, LoginState>(
                      listener: (context, state) {
                        if (state is LoginFailed) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(state.message),
                            duration: const Duration(seconds: 1),
                          ));
                        } else if (state is LoginSuccess) {
                          // go to Home Screen
                          context.go('/home/${state.username}');
                        }
                      },
                      builder: (context, state) {
                        if (state is LoginLoading) {
                          return const CircularProgressIndicator(
                            color: Colors.red,
                          );
                        }
                        return Center(
                          child: SizedBox(
                            width: 100,
                            child: OutlinedButton(
                                onPressed: () {
                                  final username =
                                      _usernameController.text.trim();
                                  final password =
                                      _passwordController.text.trim();
                                  print('$username, $password');
                                  context.read<LoginBloc>().add(OnLogin(
                                      username: username, password: password));
                                },
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  shape: const StadiumBorder(),
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: Text(
                                  'Login',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white, fontSize: 18.0),
                                )),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
