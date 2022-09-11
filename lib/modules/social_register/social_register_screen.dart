import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/components/components.dart';

import '../../../layouts/social_app/social_layout.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SocialRegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialRegisterCubit(),
      child: BlocConsumer<SocialRegisterCubit, SocialRegisterStates>(
        listener: (context, state) {
          if (state is SocialCreateUserSuccessState) {
            naviagteToAndReplace(
              context,
              SocialLayout(),
            );
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
                          'REGISTER',
                          style: Theme.of(context).textTheme.headline4!.copyWith(
                                color: Colors.black,
                              ),
                        ),
                        Text(
                          'Register now to communicate with friends',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.grey,
                              ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defualtInput(
                          controller: nameController,
                          inputType: TextInputType.name,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'please enter your name';
                            }
                          },
                          text: 'User Name',
                          iconPre: Icons.person,
                        ),
                        SizedBox(
                          height: 15.0,
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
                          iconSuff: SocialRegisterCubit.get(context).suffix,
                          onSubmitted: (value) {},
                          isPassword:
                              SocialRegisterCubit.get(context).isPassword,
                          suffPressed: () {
                            SocialRegisterCubit.get(context)
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
                          height: 15.0,
                        ),
                        defualtInput(
                          controller: phoneController,
                          inputType: TextInputType.phone,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'please enter your phone number';
                            }
                          },
                          text: 'Phone',
                          iconPre: Icons.phone,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! SocialRegisterLoadingState,
                          builder: (context) => defualtButton(
                            test: () {
                              if (formKey.currentState!.validate()) {
                                SocialRegisterCubit.get(context).userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                );
                              }
                            },
                            text: 'register',
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
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
