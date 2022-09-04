import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/cubit/states.dart';



class AppCubit extends Cubit<ShopLoginStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  // IconData suffix = Icons.visibility;
  // bool isPassword = true;
  // ShopLoginModel? loginModel;
  // int currentIndex = 0;
  //
  // void changeBottom(int index) {
  //   currentIndex = index;
  //   emit(ShopChangeBottomNavState());
  // }
  //
  // List<Widget> screens = [
  //   ProductsScreen(),
  //   CategoriesScreen(),
  //   FavoritesScreen(),
  //   SettingScreen(),
  // ];
  //
  // void changePasswordVisibility() {
  //   isPassword = !isPassword;
  //
  //   suffix = isPassword ? Icons.visibility : Icons.visibility_off_outlined;
  //   emit(PasswordVisibility());
  // }
  //
  // void userLogin({
  //   required String Email,
  //   required String Password,
  // }) {
  //   emit(ShopLoginLoadingState());
  //   dioHelper.postData(path: LOGIN, data: {
  //     'email': Email,
  //     'password': Password,
  //   }).then((value) {
  //     print(value.data);
  //     loginModel = ShopLoginModel.fromJson(value.data);
  //     print(loginModel!.status);
  //     print(loginModel!.message);
  //     print(loginModel!.data!.token);
  //
  //     emit(ShopLoginSuccessState(loginModel!));
  //   }).catchError((onError) {
  //     emit(ShopLoginErrorState(onError.toString()));
  //     showToast(
  //       text: "لم نتمكن من تسجيل الدخول برجاء التأكد من البيانات المدخلة",
  //       state: ToastStates.ERROR,
  //     );
  //   });
  // }
  //
  // HomeModel? homeModel;
  // Map<int?, bool?> favorites = {};
  //
  // void getHomeData() {
  //   emit(ShopLoadingHomeDataState());
  //
  //   dioHelper
  //       .getData(
  //     path: HOME,
  //     token: token,
  //   )
  //       .then((value) {
  //     homeModel = HomeModel.fromjson(value.data);
  //
  //     homeModel!.data!.products.forEach((element) {
  //       favorites.addAll({
  //         element.id: element.inFavorites,
  //       });
  //     });
  //     print(favorites.toString());
  //     emit(ShopSuccessHomeDataState());
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(ShopErrorHomeDataState());
  //   });
  // }
  //
  // CategoriesModel? categoriesModel;
  //
  // void getCategoriesData() {
  //   dioHelper
  //       .getData(
  //     path: GET_CATEGORIES,
  //     token: token,
  //   )
  //       .then((value) {
  //     categoriesModel = CategoriesModel.fromjson(value.data);
  //
  //     emit(ShopSuccessCategoriesDataState());
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(ShopErrorCategoriesDataState());
  //   });
  // }
  //
  // ChangeFavoriteModel? changeFavoriteModel;
  //
  // void changeFavorites(int productId) {
  //   favorites[productId]= !favorites[productId]!;
  //   emit(ShopChangeFavoriteState());
  //
  //   dioHelper
  //       .postData(
  //     path: FAVORITES,
  //     data: {
  //       'product_id': productId,
  //     },
  //     token: token,
  //   ).then((value) {
  //     changeFavoriteModel = ChangeFavoriteModel.fromjson(value.data);
  //     print(value.data);
  //     if(changeFavoriteModel?.status ==false ){
  //       favorites[productId]= !favorites[productId]!;
  //
  //     }
  //     else{
  //       getFavorites();
  //     }
  //     emit(ShopSuccessChangeFavoriteState(changeFavoriteModel!));
  //   }).catchError((error) {
  //     favorites[productId]= !favorites[productId]!;
  //
  //     emit(ShopErrorChangeFavoriteState());
  //   });
  // }
  //
  // FavoritesModel? favoriteModel;
  //
  // void getFavorites() {
  //   emit(ShopLoadingGetFavoritesState());
  //   dioHelper
  //       .getData(
  //     path: FAVORITES,
  //     token: token,
  //   )
  //       .then((value) {
  //     favoriteModel = FavoritesModel.fromJson(value.data);
  //     printFullText(value.data.toString());
  //     emit(ShopSuccessGetFavoriteState());
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(ShopErrorGetFavoriteState());
  //   });
  // }
  //
  //   ShopLoginModel? userModel;
  // void getUserData() {
  //   emit(ShopLoadingUpdateUserState());
  //
  //   dioHelper
  //       .getData(
  //     path: PROFILE,
  //     token: token,
  //   )
  //       .then((value) {
  //     userModel = ShopLoginModel.fromJson(value.data);
  //     print(userModel!.data!.name);
  //
  //     emit(ShopSuccessUpdateUserState(userModel!));
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(ShopErrorUpdateUserState());
  //   });
  // }
  // void updateUserData({
  //   required String name,
  //   required String email,
  //   required String phone,
  // }) {
  //   emit(ShopLoadingUpdateUserState());
  //
  //   dioHelper.putData(
  //     url: UPDATE_PROFILE,
  //     token: token,
  //     data: {
  //       'name': name,
  //       'email': email,
  //       'phone': phone,
  //     },
  //   ).then((value) {
  //     userModel = ShopLoginModel.fromJson(value.data);
  //     printFullText(userModel!.data!.name);
  //
  //     emit(ShopSuccessUpdateUserState(userModel!));
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(ShopErrorUpdateUserState());
  //   });
  // }

}

