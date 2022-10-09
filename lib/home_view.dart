import 'package:belajarflutter/home_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(viewModelBuilder: () => HomeViewModel(),
        builder: (context, model, child) => SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(title: Text("Smart Watering"),
                centerTitle: true,
              ),
              body: Container(
                margin: EdgeInsets.all(5),
                height: 230,
                width: double.maxFinite,
                child: Card(
                  elevation: 5,
                  child: Container(
                    child: Padding(padding: EdgeInsets.all(7),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Stack(
                                  children: [
                                    Text("Data Smart Watering",
                                      style: TextStyle(fontSize: 14),
                                      textAlign: TextAlign.center,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            Icon(Icons.settings, color: Colors.green,)
                                          ],
                                        )
                                      ],
                                    )

                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )));
  }
}
