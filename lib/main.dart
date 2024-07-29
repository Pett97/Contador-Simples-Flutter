import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int count = 0;

  bool get isEmpty => count == 0;
  bool get isFull => count == 25;

  void decrement() {
    if (count != 0) {
      setState(() {
        count--;
      });
    }
  }

  void increment() {
    if(count !=25){
      setState(() {
      count++;
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 202, 187, 187),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/shield.png'),
                  fit: BoxFit.contain)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text( isFull? "LOTADO":"Pode Entrar",
                  style: TextStyle(
                      fontSize: 26,
                      color: isFull?  Color.fromARGB(255, 245, 1, 1) : Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w700)),
              Padding(
                  padding: const EdgeInsets.all(32),
                  child: Text(
                    '$count',
                    style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 217, 226, 228)),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: isEmpty? null: decrement,
                      style: TextButton.styleFrom(
                          backgroundColor:
                             isEmpty?  Color.fromARGB(255, 54, 56, 53) : Color.fromARGB(255, 87, 233, 30) ,
                          fixedSize: const Size(90, 90),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24))),
                      child: const Text(
                        "Saiu",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      )),
                  const SizedBox(
                    width: 25,
                  ),
                  TextButton(
                      onPressed:isFull?null :  increment,
                      style: TextButton.styleFrom(
                          backgroundColor:
                             isFull? Color.fromARGB(255, 212, 14, 14):Color.fromARGB(255, 217, 231, 17),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          fixedSize: const Size(90, 90)),
                      child: const Text(
                        "Entrou",
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      )),
                ],
              )
            ],
          ),
        ));
  }
}
