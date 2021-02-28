// import 'package:flutter/material.dart';

// class ButtonForm extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 30,
//       decoration: BoxDecoration(
//         color: Color(0xFF368B61),
//         borderRadius: BorderRadius.all(
//           Radius.circular(3),
//         ),
//       ),
//       child: FlatButton(
//         child: Center(
//           child: Text(
//             "Salvar",
//             style: TextStyle(color: Colors.white, fontSize: 20),
//           ),
//         ),
//         onPressed: () {
//           widget.favorite.put(
//             Favorite(
//               title: ctrlTitle.text,
//               description: ctrlDescription.text,
//               category: null,
//               cover: imageFile,
//             ),
//           );
//           Navigator.pop(context, false);
//         },
//       ),
//     );
//   }
// }
