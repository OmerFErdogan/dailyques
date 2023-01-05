import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:rxdart/rxdart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamController<String> controller = StreamController<String>();
  final selected = BehaviorSubject<int>();
  int reward = 0;
  //bool renkSorgu = false; // false == kirmizi
  int renkSorgu = 3; // 0 == kirmizi 1 == siyah 2==sifir 3==default

  @override
  Widget build(BuildContext context) {
    final items = [for (int i = 0; i < 63; i++) i];
    // print(reward);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Rulet"),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  height: 600,
                  width: 600,
                  child: FortuneWheel(
                    physics: CircularPanPhysics(
                        curve: Curves.decelerate,
                        duration: const Duration(seconds: 1)),
                    animateFirst: false,
                    selected: selected.stream,
                    items: [
                      for (var item in items)
                        FortuneItem(
                            style: FortuneItemStyle(
                                textAlign: TextAlign.center,
                                textStyle: const TextStyle(fontSize: 13),
                                color: item == 0
                                    ? Colors.orange
                                    : item % 2 == 0
                                        ? Colors.red
                                        : Colors.black,
                                borderWidth: 1),
                            child: Container(
                                child: Text(
                              item.toString().padLeft(2, "0"),
                            ))),
                    ],
                    onAnimationEnd: () {
                      setState(() {
                        reward = items[selected.value];
                        print(reward);
                        if(renkSorgu == 1 && reward %2==1)
                        {
                           var snackBar = SnackBar(
                            content: Text("Gelen Değer:" +
                                items[selected.value].toString()+" Siyah Kazandı. Siz de Kazandınız"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        else if(renkSorgu == 0 && reward%2==0 && reward!=0){
                           var snackBar = SnackBar(
                            content: Text("Gelen Değer:" +
                                items[selected.value].toString()+" Kırmızı kazandı. siz de öyle"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        else if(renkSorgu==3){
                           var snackBar = SnackBar(
                            content: Text("Gelen Değer:" +
                                items[selected.value].toString()+"Seçim Yapılmadı"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        else{
                           var snackBar = SnackBar(
                            content: Text("Gelen Değer:" +
                                items[selected.value].toString()+" ${items[selected.value] % 2 == 0 ? "Renk Kırmızı ve": "Renk Siyah ve" } "+" Kazanamadınız"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      });
                    },
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        selected.add(Fortune.randomInt(0, items.length));
                      },
                    );
                  },
                  child: Text("Çevir")),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          renkSorgu = 0;
                        });
                      },
                      child: const Text("KIRMIZI"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          renkSorgu = 1;
                        });
                      },
                      child: const Text("SİYAH"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
