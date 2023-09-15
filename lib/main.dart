import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AUK Counter App',
      home: MyStateFullApp(placeholder: 'placeholder'),
    );
  }
}

class MyStateFullApp extends StatefulWidget {
  const MyStateFullApp({super.key, required this.placeholder});

  final String placeholder;

  @override
  State<MyStateFullApp> createState() => _MyStateFullAppState();
}

class _MyStateFullAppState extends State<MyStateFullApp> {
  final TextEditingController myTest = TextEditingController();

  String _text = '';

  @override
  void dispose() {
    myTest.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _text,
                style: const TextStyle(
                  fontSize: 59,
                  color: Colors.white,
                ),
              ),
              BottomBorderTextField(
                hint: widget.placeholder,
                control: myTest,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(10000, 30.0),
                      backgroundColor: const Color.fromARGB(255, 32, 28, 28),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _text = myTest.text;
                      });
                    },
                    child: const Text('data')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomBorderTextField extends StatelessWidget {
  const BottomBorderTextField(
      {super.key, required this.hint, required this.control});

  final String hint;
  final TextEditingController control;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
            bottom: BorderSide(
          width: 2,
          color: Color.fromARGB(255, 208, 21, 8),
        )),
      ),
      child: TextField(
        controller: control,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          prefixIcon: const Icon(
            Icons.monetization_on_outlined,
            color: Colors.black,
          ),
          border: InputBorder.none, // Hide the default border
        ),
      ),
    );
  }
}
