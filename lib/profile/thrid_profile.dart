import 'package:flutter/material.dart';

class ThreeUser extends StatelessWidget {
  final List<String> name;
  final List<String> url;
  const ThreeUser({super.key, required this.name, required this.url});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      height: 180 * name.length.toDouble(),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: name.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              width: 330,
              height: 150,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(100, 7, 16, 26),
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
                          backgroundImage: NetworkImage(url[index], scale: 2.0),
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
                        child: Text(name[index],
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                            )),
                      ),
                    ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
