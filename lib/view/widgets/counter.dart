import 'package:flutter/material.dart';
import 'package:selecteat_app/utils/constants.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key, required this.person}) : super(key: key);
  final int person;
  
  @override
  State<StatefulWidget> createState() {
    return _CounterState();
  }
}

class _CounterState extends State<Counter> {
  int _count = 10;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: brandPrimaryColor,
                    width: 1.0,
                    style: BorderStyle.solid,
                  )),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          _count += 1;
                        });
                      },
                    ),
                    Text(_count.toString() + " people"),
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          _count -= 1;
                        });
                      },
                    ),
                  ])),
        ),
      ],
    );
  }
}
