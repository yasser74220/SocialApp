 import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../shared/styles/icon_broken.dart';


Widget defualtButton({
  double width = double.infinity,
  Color color = Colors.blue,
  required Function() test,
  required String text,
}) =>
    Container(
      width: width,
      color: color,
      child: MaterialButton(
        onPressed: test,
        child: Text(
          "$text",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

Widget defaultTextButton
    ({
  required Function() onPressed,
  required String text

}) =>
    TextButton
      (

        onPressed: onPressed, child: Text(text, style: TextStyle(fontSize: 14,color: Colors.blue),));

Widget myDivider() =>
    Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

// Widget buildArticleItem(article, context) =>
//     InkWell(
//       onTap: () {
//         navigateTo(
//           context,
//           WebViewScreen(article['url']),
//         );
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Row(
//           children: [
//             Container(
//               width: 120.0,
//               height: 120.0,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(
//                   10.0,
//                 ),
//                 image: DecorationImage(
//                   image: NetworkImage('${article['urlToImage']}'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 20.0,
//             ),
//             Expanded(
//               child: Container(
//                 height: 120.0,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         '${article['title']}',
//                         style: Theme
//                             .of(context)
//                             .textTheme
//                             .bodyText1,
//                         maxLines: 3,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     Text(
//                       '${article['publishedAt']}',
//                       style: TextStyle(
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 15.0,
//             ),
//           ],
//         ),
//       ),
//     );

// Widget articleBuilder(list, BuildContext context, {bool isSearch = false}) =>
//     ConditionalBuilder(
//       condition: list.length > 0,
//       builder: (context) =>
//           ListView.separated(
//             physics: BouncingScrollPhysics(),
//             itemBuilder: (context, index) =>
//                 buildArticleItem(list[index], context),
//             separatorBuilder: (context, index) => myDivider(),
//             itemCount: list.length,
//           ),
//       fallback: (context) => Center(child: CircularProgressIndicator()),
//     );

Widget defualtInput({
  required TextEditingController controller,
  Function(String)? onSubmitted,
  Function(String)? change,
  required TextInputType inputType,
  void Function()? suffPressed,
  bool issuffix = false,
  bool isPassword = false,
  String? text,
  IconData? iconPre,
  IconData? iconSuff,
  Function()? onTap,
  required FormFieldValidator<String> validate,
}) =>
    TextFormField(
      obscureText: isPassword ? true : false,
      controller: controller,
      onFieldSubmitted: onSubmitted,
      onChanged: change,
      keyboardType: inputType,
      validator: validate,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: "$text",
        prefixIcon: Icon(iconPre),
        suffixIcon: issuffix != null
            ? IconButton(onPressed: suffPressed, icon: Icon(iconSuff))
            : null,
        border: OutlineInputBorder(),
      ),
    );

void navigateTo(context, widget) =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void naviagteToAndReplace(context, widget) =>
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ));

// Widget buildBoardingItem(BoardingModel boarding) =>
//     Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           child: Image(
//             image: AssetImage('${boarding.image}'),
//           ),
//         ),
//         SizedBox(height: 20),
//         Text('${boarding.title}',
//             style: TextStyle(
//               fontSize: 20,
//               fontFamily: 'Jannah',
//             )),
//         SizedBox(height: 20),
//         Text('${boarding.body}',
//             style: TextStyle(
//               fontSize: 15,
//               fontFamily: 'Jannah',
//             )),
//       ],
//     );
void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

// enum
// ignore: constant_identifier_names
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}

// Widget buildListProduct(  model, context, { bool isOldPrice = true}) => Padding(
//   padding: const EdgeInsets.all(20.0),
//   child: Container(
//     height: 120.0,
//     child: Row(
//       children:
//       [
//         Stack(
//           alignment: AlignmentDirectional.bottomStart,
//           children:
//           [
//             Image(
//               image: NetworkImage(model.image!),
//               width: 120.0,
//               height: 120.0,
//             ),
//             if (model.discount != 0)
//               Container(
//                 color: Colors.red,
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 5.0,
//                 ),
//                 child: Text(
//                   'DISCOUNT',
//                   style: TextStyle(
//                     fontSize: 8.0,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//           ],
//         ),
//         SizedBox(
//           width: 20.0,
//         ),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 model.name!,
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(
//                   fontSize: 14.0,
//                   height: 1.3,
//                 ),
//               ),
//               Spacer(),
//               Row(
//                 children: [
//                   Text(
//                     model.price.toString(),
//                     style: TextStyle(
//                       fontSize: 12.0,
//                       color: Colors.blue,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 5.0,
//                   ),
//                   if (model.discount != 0 && isOldPrice)
//                     Text(
//                       model.oldPrice.toString(),
//                       style: TextStyle(
//                         fontSize: 10.0,
//                         color: Colors.grey,
//                         decoration: TextDecoration.lineThrough,
//                       ),
//                     ),
//                   Spacer(),
//                   IconButton(
//                     onPressed: ()
//                     {
//                       AppCubit.get(context).changeFavorites(model.id!);
//                     },
//                     icon: CircleAvatar(
//                       radius: 15.0,
//                       backgroundColor:
//                       AppCubit.get(context).favorites[model.id]!
//                           ?  Colors.grey
//                           : Colors.blue,
//                       child: Icon(
//                         Icons.favorite_border,
//                         size: 14.0,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   ),
// );

PreferredSizeWidget defaultAppBar
    ({
  required BuildContext context,
  List<Widget>?actions,
  String ? title,
}) =>
    AppBar

      (
      titleSpacing: 5.0,
      leading: IconButton(onPressed: () {
        Navigator.pop(context);
      }, icon: Icon(IconBroken.Arrow___Left_2),),
      actions: actions,
      title: Text(title!,),
    );