import 'package:flutter/material.dart';
import 'package:primeiroapp/classes/favorite.dart';

import 'package:primeiroapp/widgets/show_dialog_delete.widget.dart';
import 'package:primeiroapp/routes/app_routes.dart';

class FavoriteTile extends StatefulWidget {
  final Favorite favorite;

  const FavoriteTile(this.favorite);

  @override
  _FavoriteTileState createState() => _FavoriteTileState();
}

class _FavoriteTileState extends State<FavoriteTile> {
  _edit() {
    if (widget.favorite.type == 'serie') {
      Navigator.of(context).pushNamed(
        AppRoutes.ADD_SERIE,
        arguments: widget.favorite,
      );
    } else if (widget.favorite.type == 'movie') {
      Navigator.of(context).pushNamed(
        AppRoutes.ADD_MOVIE,
        arguments: widget.favorite,
      );
    }
  }

  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.green,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: ListTile(
        title: Text(widget.favorite.title),
        subtitle: Text(widget.favorite.category),
        trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit, color: Colors.green),
                onPressed: _edit,
              ),
              IconButton(
                icon: widget.favorite.watched
                    ? Icon(
                        Icons.check_box,
                        color: Colors.green,
                      )
                    : Icon(
                        Icons.check_box_outline_blank,
                        color: Colors.green,
                      ),
                onPressed: () {
                  setState(() {
                    widget.favorite.watched = !widget.favorite.watched;
                  });
                },
              ),
              // IconButton(
              //   icon: Icon(Icons.delete),
              //   onPressed: () {
              //     ShowDialogDelete.show(context, widget.favorite);
              //   },
              // ),
            ],
          ),
        ),
        onTap: () {
          if (widget.favorite.type == 'serie') {
            Navigator.of(context).pushNamed(
              AppRoutes.READFAVSERIE,
              arguments: widget.favorite,
            );
          } else if (widget.favorite.type == 'movie') {
            Navigator.of(context).pushNamed(
              AppRoutes.READFAVMOVIE,
              arguments: widget.favorite,
            );
          }
        },
      ),
      confirmDismiss: (DismissDirection direction) async {
        return await ShowDialogDelete.show(context, widget.favorite);
      },
      onDismissed: (direction) {},
    );
  }

//   Widget buildItem(BuildContext context, dynamic index, dynamic list) {
//     return Dismissible(
//       key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
//       background: Container(
//         color: Colors.ge,
//         child: Align(
//           alignment: Alignment(-0.9, 0.0),
//           child: Icon(Icons.delete, color: Colors.white),
//         ),
//       ),
//       direction: DismissDirection.startToEnd,
//       child: CheckboxListTile(
//         title: Text(_toDoList[index]["title"]),
//         value: _toDoList[index]["ok"],
//         secondary: CircleAvatar(
//           child: Icon(_toDoList[index]["ok"] ? Icons.check : Icons.error),
//         ),
//         onChanged: (c) {
//           setState(() {
//             _toDoList[index]["ok"] = c;
//             _saveData();
//           });
//         },
//       ),
//       onDismissed: (direction) {
//         setState(() {
//           _lastRemoved = Map.from(_toDoList[index]);
//           _lastRemovePos = index;
//           _toDoList.removeAt(index);

//           _saveData();

//           final snack = SnackBar(
//             content: Text("Tarefa \"${_lastRemoved["title"]}\" removida!"),
//             action: SnackBarAction(
//                 label: "Desfazer",
//                 onPressed: () {
//                   setState(() {
//                     _toDoList.insert(_lastRemovePos, _lastRemoved);
//                     _saveData();
//                   });
//                 }),
//             duration: Duration(seconds: 2),
//           );
//           Scaffold.of(context).removeCurrentSnackBar();
//           Scaffold.of(context).showSnackBar(snack);
//         });
//       },
//     );
//   }
}
