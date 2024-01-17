import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/login/login_cubit.dart';
import "package:validators/validators.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  late String _password, _email;

  @override
  Widget build(BuildContext context) {
    void _submit() {
      context.read<LoginCubit>().setIsLoading(loginStatus: LoginStatus.LOADING);
      _autovalidateMode = AutovalidateMode.always;
      final form = _formKey.currentState;
      if (form == null || !form.validate()) {
        context
            .read<LoginCubit>()
            .setIsLoading(loginStatus: LoginStatus.INITIAL);
        return;
      }
      form.save();
      context.read<LoginCubit>().singIn(email: _email, password: _password);
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                height: double.maxFinite,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 132,
                      height: 160,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              AssetImage("assets/images/flutter_big_logo.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 90,
                    ),
                    Container(
                      child: BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {
                          if (state.user != null) {
                            Navigator.pushNamed(context, "/main");
                          }
                        },
                        builder: (context, state) {
                          return Form(
                            key: _formKey,
                            autovalidateMode: _autovalidateMode,
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (String value) {
                                    setState(() {
                                      _email = value;
                                    });
                                  },
                                  validator: (String? emailInput) {
                                    if (emailInput == null ||
                                        emailInput.trim().isEmpty) {
                                      return "Email required";
                                    } else if (!isEmail(emailInput.trim())) {
                                      return "Email input needs to be an email";
                                    }
                                  },
                                  cursorColor: Color(0xffB9C3FF),
                                  style: TextStyle(
                                    color: Color(0xffC6C5D0),
                                  ),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color(0xff434659),
                                    hintText: "Email",
                                    // focusedBorder: InputBorder.none,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xffC6C5D0)),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  onChanged: (String value) {
                                    setState(() {
                                      _password = value;
                                    });
                                  },
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter a password";
                                    } else if (value.trim().length < 3) {
                                      return "Please enter a longer password";
                                    }
                                  },
                                  cursorColor: Color(0xffC6C5D0),
                                  style: TextStyle(
                                    color: Color(0xffC6C5D0),
                                  ),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color(0xff434659),
                                    hintText: "Password",
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffC6C5D0),
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                state.status == LoginStatus.ERROR
                                    ? Center(
                                        child: Text(
                                          "Wrong Credentials",
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      )
                                    : Container(),
                                SizedBox(
                                  height: 20,
                                ),
                                Opacity(
                                  opacity: state.status == LoginStatus.LOADING
                                      ? 0.5
                                      : 1,
                                  child: ElevatedButton(
                                    onPressed:
                                        state.status == LoginStatus.LOADING
                                            ? null
                                            : () {
                                                _submit();
                                              },
                                    style: ElevatedButton.styleFrom(
                                      disabledBackgroundColor:
                                          Color(0xffB9C3FF),
                                      backgroundColor: Color(0xffB9C3FF),
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12.0),
                                    ),
                                    child: Text(
                                      "Sign In",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Color(0xff00218C),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
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
