import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  var output = "";
  List<dynamic> lst = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: ListView.builder(
          itemCount: lst.length,
          itemBuilder: (context, index) {
            return Container(
                height: 50,
                color: Colors.purple[300],
                margin: EdgeInsets.only(top: 15),
                child: ListTile(
                  title: Text("${lst[index]}"),
                  trailing: Container(
                    width: 50,
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Edit Item"),
                                    content: TextField(
                                      decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.purple)),
                                                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.purple)),),
                                      onChanged: (value) {
                                        output = value;
                                      },
                                    ),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              lst.replaceRange(
                                                  index, index + 1, {output});
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.purple[300],
                                            textStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          child: Text("Edit")),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Icon(Icons.edit)),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                lst.removeAt(index);
                              });
                            },
                            child: Icon(Icons.delete)),
                      ],
                    ),
                  ),
                ));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Add Item"),
                  content: TextField(
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                            ),
                    onChanged: (value) {
                      output = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            lst.add(output);
                          });
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple[300],
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text("Add")),
                  ],
                );
              });
        },
        child: Text("+",style: TextStyle(
                      fontWeight: FontWeight.bold , fontSize: 30,),),
        backgroundColor: Colors.purple[300],
      ),
    );
  }
}
