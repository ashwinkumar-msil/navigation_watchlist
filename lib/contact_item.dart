import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'contact_data_model.dart';

Widget userList(BuildContext context, int index, List<Contact> data) {
  return Container(
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
      color: Colors.white,
    ),
    width: double.infinity,
    height: 80,
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                data[index].name,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 6,
              ),
              // Row(
              //   children: <Widget>[
              //     const SizedBox(
              //       width: 5,
              //     ),
              //     Text(ContactData[index]['id'],
              //         style: const TextStyle(
              //             color: Colors.black,
              //             fontSize: 13,
              //             letterSpacing: .3)),
              //   ],
              // ),
              // const SizedBox(
              //   height: 6,
              // ),
              Row(
                children: <Widget>[
                  const SizedBox(
                    width: 5,
                  ),
                  Text(data[index].contacts,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          letterSpacing: .3)),
                ],
              ),
            ],
          ),
        ),
        Center(
          child: Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.only(left: 15),
              // child: Text('image'
              child: Image.network(data[index].url)),
        ),
      ],
    ),
  );
}
