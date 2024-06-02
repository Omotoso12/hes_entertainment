import 'package:flutter/material.dart';

class OneUser extends StatelessWidget {
  final String name;
  final String url;
  const OneUser({super.key, required this.name, required this.url});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      height: 150,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            width: 330,
            height: 150,
            decoration: BoxDecoration(
                color: const Color.fromARGB(125, 7, 16, 26),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.02,
                    ),
                    ///////////////////////////////////////////////////////////////////////////
                    Center(
                      child: CircleAvatar(
                        maxRadius: 30,
                        backgroundImage: NetworkImage(url, scale: 2.0),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).height * 0.02,
                    ),

                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.02,
                    ),

                    ////////////name field....
                    Center(
                      child: Text(name,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                          )),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
