import 'package:social_app/layouts/social_app/cubit/cubit.dart';

abstract class SocialStates {}

class SocialInitialState extends SocialStates {}

class SocialGetUserLoadingState extends SocialStates {}

class SocialGetUserSuccessState extends SocialStates {}

class SocialGetUserErrorState extends SocialStates
{
  final String error;

  SocialGetUserErrorState(this.error);
}
class SocialGetPostsLoadingState extends SocialStates {}

class SocialGetPostsSuccessState extends SocialStates {}

class SocialGetPostsErrorState extends SocialStates
{

}

class ChangeBottomNavState extends SocialStates{}
class SocialNewPostState extends SocialStates{}
class SocialProfileImagePickedSuccessState extends SocialStates{}

class SocialProfileImagePickedErrorState extends SocialStates{}

class SocialCoverImagePickedSuccessState extends SocialStates{}

class SocialCoverImagePickedErrorState extends SocialStates{}
class SocialPostImagePickedSuccessState extends SocialStates{}

class SocialPostImagePickedErrorState extends SocialStates{}

class SocialUploadProfileImagePickedSuccessState extends SocialStates{}
class SocialUploadProfileImagePickedErrorState extends SocialStates{}

class SocialUploadCoverImagePickedSuccessState extends SocialStates{}
class SocialUploadCoverImagePickedErrorState extends SocialStates{}

class SocialUserUpdateErrorState extends SocialStates{}
class SocialUserUpdateLoadingState extends SocialStates{}

class SocialCreatePostLoadingState extends SocialStates{}
class SocialCreatePostSuccessState extends SocialStates{}
class SocialCreatePostErrorState extends SocialStates{}
class SocialRemovePostImageState extends SocialStates{}


