import 'package:flutter/material.dart';

class AddCityLayout extends StatelessWidget {
  Function onBtnPress;
  AddCityLayout({Key? key, required this.onBtnPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Add City",
            style: TextStyle(fontSize: 28),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            color: Colors.transparent,
            child: IconButton(
              icon: const Icon(
                Icons.add,
                size: 120,
              ),
              onPressed: () => onBtnPress(),
            ),
          ),
          Image.asset(
            "assets/images/city_image.png",
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.25,
          ),
        ],
      ),
    );
  }
}
