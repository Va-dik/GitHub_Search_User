import 'package:flutter/material.dart';
import 'package:gihub_search_user/models/user_model.dart';

class CustomCard extends StatelessWidget {
  final User user;

  const CustomCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width * 0.8;
    double screenHeight = screenSize.height * 0.45;

    const BorderRadius containerBorderRadius =
        BorderRadius.all(Radius.circular(15));

    TextStyle textStyle =
        const TextStyle(fontWeight: FontWeight.w600, fontSize: 18);

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.all(10),
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 108, 108, 108),
            width: 3,
          ),
          borderRadius: containerBorderRadius,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                width: screenWidth,
                padding: const EdgeInsets.all(3),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                  child: Image.network(
                    user.avatarUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: screenWidth,
                margin: const EdgeInsets.only(left: 3, right: 3, bottom: 3),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 228, 189, 73),
                  borderRadius: containerBorderRadius.subtract(
                      const BorderRadius.vertical(
                          top: Radius.circular(15),
                          bottom: Radius.circular(5))),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Username: ${user.login}', style: textStyle),
                    Text('Created at: ${user.createdAt}', style: textStyle),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
