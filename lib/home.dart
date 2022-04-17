// ignore_for_file: prefer_const_constructors, prefer_single_quotes, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pessoas = 0;
  bool limite = false;
  bool get isFull => pessoas == 20;
  bool get isEmpty => pessoas == 0;

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black87,
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                scale: 2.4,
                repeat: ImageRepeat.repeat,
                image: AssetImage('assets/images/pizza.jpg'),
              ),
            ),
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Text(pessoas != 20 ? 'Pessoas' : 'Lotado',
                      style: const TextStyle(
                        fontSize: 35,
                        letterSpacing: 4,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      )),
                ),
                Container(
                  child: Text('$pessoas/20',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: (!isFull) ? Colors.white : Colors.redAccent,
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(190, 255, 255, 255),
                          fixedSize: Size(85, 70),
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: isEmpty
                            ? null
                            : () {
                                if (!isEmpty) {
                                  setState(() {
                                    pessoas--;
                                  });
                                }
                              },
                        child: Text("Saiu",
                            style: TextStyle(
                              fontSize: 19,
                            ))),
                    const SizedBox(width: 30),
                    TextButton(
                      style: TextButton.styleFrom(
                        elevation: 3,
                        backgroundColor: Color.fromARGB(190, 255, 255, 255),
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        fixedSize: Size(85, 70),
                      ),
                      onPressed: isFull
                          ? null
                          : () {
                              if (!isFull) {
                                setState(() {
                                  pessoas++;
                                });
                              }
                            },
                      child: Text(
                        "Entrou",
                        style: TextStyle(
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
