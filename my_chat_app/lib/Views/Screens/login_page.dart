import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_chat_app/Utils/my_routes.dart';

import '../../Helper/fb_helper.dart';
import '../../Helper/firebase_helper.dart';
import '../../Modal/user_modal.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {


    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    GlobalKey<FormState>loginKey = GlobalKey<FormState>();
    String? email;
    String? password;


    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              Container(
                height: 600,
                width: 400,
                margin: const EdgeInsets.all(5),
                decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade600,
                      offset: const Offset(3, 3),
                      blurRadius: 3,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: loginKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children:   [
                        const SizedBox(
                          height: 60,
                        ),
                        const Text("Login to your account",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        TextFormField(
                          validator: (val) {
                            if (val!.isEmpty){
                              return "please Enter Your Email";
                            }
                            else {
                              return null;
                            }

                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: "Email Address",
                            labelText: "Email",
                            suffixIcon:  Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10),),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          validator: (val) {
                            if (val!.isEmpty){
                              return "please Enter Your Password";
                            }
                            else {
                              return null;
                            }

                          },
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          obscuringCharacter: "*",
                          controller: passwordController,
                          decoration: const InputDecoration(
                            hintText: "Password",
                            labelText: "Password",
                            suffixIcon:  Icon(Icons.wifi_password_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10),),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        CupertinoButton(
                          color: CupertinoColors.activeBlue,
                          borderRadius: BorderRadius.circular(10),
                          alignment: Alignment.center,
                          child: const Text("Login"),
                          onPressed: () {
                            loginKey.currentState!.validate();
                            FbHelper.fbHelper.emailPasswordLogIn(
                              email: email!,
                              password: password!,
                              context: context,
                            );
                            User? user = FbHelper.fbHelper.firebaseAuth.currentUser;

                            if (FbHelper.fbHelper.firebaseAuth.currentUser !=
                                null) {
                              Navigator.of(context)
                                  .pushReplacementNamed(MyRoutes.home, arguments: user);
                            }  else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Id not Found"),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }

                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                       ElevatedButton.icon(
                         style: const ButtonStyle(
                           backgroundColor: MaterialStatePropertyAll(CupertinoColors.activeBlue),
                           foregroundColor: MaterialStatePropertyAll(Colors.white),
                         ),
                         onPressed: () async {

                           await FbHelper.fbHelper.signInWithGoogle();
                           FireStoreHelper.fireStoreHelper.adduser(
                               user: UserModal(
                                 id: FbHelper.fbHelper.firebaseAuth.currentUser!.uid
                                     .toString(),
                                 email: FbHelper
                                     .fbHelper.firebaseAuth.currentUser!.email
                                     .toString(),
                                 password: "N/A",
                                 img: FbHelper
                                     .fbHelper.firebaseAuth.currentUser!.photoURL
                                     .toString(),
                                 username: FbHelper
                                     .fbHelper.firebaseAuth.currentUser!.displayName
                                     .toString(),
                               ));

                           Navigator.of(context).pushReplacementNamed(MyRoutes.home,
                               arguments:
                               FbHelper.fbHelper.firebaseAuth.currentUser);

                       },
                         icon: const Icon(Icons.g_mobiledata_rounded
                       ),
                         label: const Text("Google"),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            const Text("Don't have an account?",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),

                            TextButton(
                              onPressed: () {

                                Navigator.of(context).pushNamed(MyRoutes.signUpPage);

                              },
                              child: const Text("Sign Up",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
