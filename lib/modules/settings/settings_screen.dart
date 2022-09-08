import 'package:flutter/material.dart';
import 'package:social_app/shared/components/components.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(

        children: [
          Container(

            height: 190.0,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Align(
                  child: Container(
                    width: double.infinity,
                    height: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://img.freepik.com/free-photo/pretty-smiling-joyfully-female-with-fair-hair-dressed-casually-looking-with-satisfaction_176420-15187.jpg?w=1380&t=st=1662537453~exp=1662538053~hmac=b2861a258ae6b4c81b54e2461d682540a12c2dbd540a651e299a9fe698b8d5b7'))),
                  ),
                  alignment: AlignmentDirectional.topCenter,
                ),
                CircleAvatar(
                  radius: 64,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-photo/pretty-smiling-joyfully-female-with-fair-hair-dressed-casually-looking-with-satisfaction_176420-15187.jpg?w=1380&t=st=1662537453~exp=1662538053~hmac=b2861a258ae6b4c81b54e2461d682540a12c2dbd540a651e299a9fe698b8d5b7'),
                  ),
                ),

              ],
            ),
          ),
           SizedBox(height: 4,),
          Text(
            'Yasser Mohamed',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'Bioooo',
            style: Theme.of(context).textTheme.caption,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 25),
            child: Row(

              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {

                    },
                    child: Column(
                      children: [
                        Text(
                          'Yasser Mohamed',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          'Bioooo',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {

                    },
                    child: Column(
                      children: [
                        Text(
                          'Yasser Mohamed',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          'Bioooo',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {

                    },
                    child: Column(
                      children: [
                        Text(
                          'Yasser Mohamed',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          'Bioooo',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {

                    },
                    child: Column(
                      children: [
                        Text(
                          'Yasser Mohamed',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          'Bioooo',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
