import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Model/user_model.dart';

class MapUserBadge extends StatelessWidget {
  const MapUserBadge({
    Key? key,
    required this.loggedInUser,
  }) : super(key: key);

  final UserModel loggedInUser;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: Offset.zero)
            ]),
        child: Row(
          children: [
            Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ))),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${loggedInUser.firstName} ${loggedInUser.secondName}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                  Text(
                    'My location',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.location_pin,
              color: Colors.green,
              size: 40,
            )
          ],
        ));
  }
}
