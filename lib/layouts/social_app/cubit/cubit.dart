

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layouts/social_app/cubit/states.dart';
import 'package:social_app/modules/chats/chat_screen.dart';
import 'package:social_app/modules/feeds/feeds_screen.dart';
import 'package:social_app/modules/newPost/newpost_screen.dart';
import 'package:social_app/modules/users/users_screen.dart';
import 'package:social_app/shared/components/constant.dart';

import '../../../models/social_app/social_user_model.dart';
import '../../../modules/settings/settings_screen.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);

  SocialUserModel? model;

  void getUserData()
  {
    emit(SocialGetUserLoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value)
    {
          //print(value.data());
          model = SocialUserModel.fromJson(value.data()!);
          emit(SocialGetUserSuccessState());
    })
        .catchError((error) {
          print(error.toString());
      emit(SocialGetUserErrorState(error.toString()));

    });
  }

  int currentIndex = 0;
  List<Widget> screens=[
    FeedsScreen(),
    ChatsScreen(),
     UsersScreen(),
    SettingsScreen(),
  ]  ;
  List<String> titles = [
    'Home',
    'Chats',
    'New post',
    'Users',
    'Settings',
  ];
  void changeNavBar(int index){
     if(index==2){
      emit(SocialNewPostState());
    }
    else{
      currentIndex = index;

      emit(ChangeBottomNavState());

    }
  }
}
