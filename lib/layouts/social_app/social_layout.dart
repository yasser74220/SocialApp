import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/newPost/newpost_screen.dart';
import 'package:social_app/shared/components/components.dart';

import '../../shared/styles/icon_broken.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SocialLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        if(state is SocialNewPostState){
          navigateTo(context, NewPostScreen());
        }
      },
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex],
            ),
            actions: [
              IconButton(onPressed: () {

              }, icon: Icon(IconBroken.Notification),),
              IconButton(onPressed: () {

              }, icon: Icon(IconBroken.Search),),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
              onTap: (value) {
                cubit.changeNavBar(value);
              },
              items: [
            BottomNavigationBarItem(icon: Icon(IconBroken.Home), label: 'home'),
            BottomNavigationBarItem(icon: Icon(IconBroken.Chat), label: 'chat'),
            BottomNavigationBarItem(icon: Icon(IconBroken.Paper), label: 'New'),
            BottomNavigationBarItem(icon: Icon(IconBroken.User), label: 'user'),
            BottomNavigationBarItem(icon: Icon(IconBroken.Setting), label: 'setting'),
          ]),
        );
      },
    );
  }
}
