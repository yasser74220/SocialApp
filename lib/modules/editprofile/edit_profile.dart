import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/layouts/social_app/cubit/cubit.dart';
import 'package:social_app/layouts/social_app/cubit/cubit.dart';
import 'package:social_app/layouts/social_app/cubit/states.dart';
import 'package:social_app/shared/components/components.dart';

import '../../shared/styles/icon_broken.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  TextEditingController UserController = TextEditingController();
  TextEditingController BioController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var model = SocialCubit.get(context).userModel!;
        var ProfileImage = SocialCubit.get(context).profileImage;
        var CoverImage = SocialCubit.get(context).coverImage;
        UserController.text =
            SocialCubit.get(context).userModel!.name.toString();
        BioController.text = SocialCubit.get(context).userModel!.bio.toString();
        PhoneController.text =
            SocialCubit.get(context).userModel!.phone.toString();

        return Scaffold(
            appBar: defaultAppBar(
              context: context,
              title: 'Edit Profile',
              actions: [
                defaultTextButton(
                    onPressed: () {
                      SocialCubit.get(context).updateUser(
                          Phone: PhoneController.text,
                          Bio: BioController.text,
                          Name: UserController.text);
                    },
                    text: 'UPDATE'),
                SizedBox(
                  width: 10,
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    if (state is SocialUserUpdateLoadingState)
                      LinearProgressIndicator(),
                    SizedBox(
                      height: 1,
                    ),
                    Container(
                      height: 190.0,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Align(
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: CoverImage == null
                                          ? NetworkImage('${model.cover}')
                                          : FileImage(CoverImage)
                                              as ImageProvider,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    SocialCubit.get(context).getCoverImage();
                                  },
                                  icon: CircleAvatar(
                                    radius: 20,
                                    child: Icon(IconBroken.Camera, size: 16),
                                  ),
                                ),
                              ],
                            ),
                            alignment: AlignmentDirectional.topCenter,
                          ),
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                radius: 64,
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundImage: ProfileImage == null
                                      ? NetworkImage('${model.image}')
                                      : FileImage(ProfileImage) as ImageProvider,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  SocialCubit.get(context).getProfileImage();
                                },
                                icon: CircleAvatar(
                                  radius: 20,
                                  child: Icon(IconBroken.Camera, size: 16),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    if (SocialCubit.get(context).profileImage != null ||
                        SocialCubit.get(context).coverImage != null)
                      Row(
                        children: [
                          if (SocialCubit.get(context).profileImage != null)
                            Expanded(
                                child: Column(
                              children: [
                                defaultTextButton(
                                    onPressed: () {
                                      SocialCubit.get(context).uploadProfileImage(
                                        Name: UserController.text,
                                        Bio: BioController.text,
                                        Phone: PhoneController.text,
                                      );
                                    },
                                    text: 'UPLOAD PROFILE'),
                                SizedBox(
                                  height: 5,
                                ),
                                if (state is SocialUserUpdateLoadingState)
                                LinearProgressIndicator(),
                              ],
                            )),
                          SizedBox(
                            width: 1,
                          ),
                          if (SocialCubit.get(context).coverImage != null)
                            Expanded(
                                child: Column(
                              children: [
                                defaultTextButton(
                                    onPressed: () {
                                      SocialCubit.get(context).uploadCoverImage(
                                        Name: UserController.text,
                                        Bio: BioController.text,
                                        Phone: PhoneController.text,
                                      );
                                    },
                                    text: 'UPLOAD COVER'),
                                SizedBox(
                                  height: 5,
                                ),
                                if (state is SocialUserUpdateLoadingState)

                                  LinearProgressIndicator(),
                              ],
                            ))
                        ],
                      ),
                    SizedBox(
                      height: 20,
                    ),
                    defualtInput(
                        controller: UserController,
                        inputType: TextInputType.name,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            print('musntbe empty');
                          }
                        },
                        text: 'Name',
                        iconPre: IconBroken.User),
                    SizedBox(
                      height: 10,
                    ),
                    defualtInput(
                        controller: BioController,
                        inputType: TextInputType.text,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            print('musntbe empty');
                          }
                        },
                        text: 'Bio',
                        iconPre: IconBroken.Info_Circle),
                    SizedBox(
                      height: 10,
                    ),
                    defualtInput(
                        controller: PhoneController,
                        inputType: TextInputType.phone,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            print('musntbe empty');
                          }
                        },
                        text: 'Bio',
                        iconPre: IconBroken.Call),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
