

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layouts/social_app/social_layout.dart';
import '../../../shared/components/components.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../social_register/social_register_screen.dart';
 import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SocialLoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit, SocialLoginStates>(
        listener: (context, state) {
          if (state is SocialLoginErrorState) {
            showToast(
              text: state.error,
              state: ToastStates.ERROR,
            );
          }
          if(state is SocialLoginSuccessState)
          {
            CacheHelper.setData(
              key: 'uId',
              value: state.uId,
            ).then((value)
            {
              naviagteToAndReplace(
                context,
                SocialLayout(),
              );
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headline4!.copyWith(
                                color: Colors.black,
                              ),
                        ),
                        Text(
                          'Login now to communicate with friends',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.grey,
                              ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defualtInput(
                          controller: emailController,
                           inputType: TextInputType.emailAddress,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'please enter your email address';
                            }
                          },
                          text: 'Email Address',
                          iconPre: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defualtInput(
                          controller: passwordController,
                          inputType: TextInputType.visiblePassword,
                          iconSuff: SocialLoginCubit.get(context).suffix,
                          onSubmitted: (value) {
                            if (formKey.currentState!.validate()) {
                              // SocialLoginCubit.get(context).userLogin(
                              //   email: emailController.text,
                              //   password: passwordController.text,
                              // );
                            }
                          },
                          isPassword: SocialLoginCubit.get(context).isPassword,
                          suffPressed: () {
                            SocialLoginCubit.get(context)
                                .changePasswordVisibility();
                          },
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'password is too short';
                            }
                          },
                          text: 'Password',
                          iconPre: Icons.lock_outline,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! SocialLoginLoadingState,
                          builder: (context) => defualtButton(
                            test: () {
                              if (formKey.currentState!.validate()) {
                                SocialLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            text: 'login',
                           ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                            ),
                            defaultTextButton(
                              onPressed: () {
                                naviagteToAndReplace(
                                  context,
                                  SocialRegisterScreen(),
                                );
                              },
                              text: 'register',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
