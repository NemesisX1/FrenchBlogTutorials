import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:hive_tutoriel/models/app_user.dart';

class InfosPage extends StatefulWidget {
  const InfosPage({
    Key? key,
  }) : super(key: key);

  @override
  State<InfosPage> createState() => _InfosPageState();
}

class _InfosPageState extends State<InfosPage> {
  AppUser? user;
  Box<AppUser> box = Hive.box('user');
  bool _isBusy = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    try {
      user = box.getAt(0);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes infos"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: user == null
                ? []
                : <Widget>[
                    Text(
                      "Username: ${user!.username.toString()}",
                    ),
                    Text(
                      "Password: ${user!.password.toString()}",
                    ),
                    const Gap(10),
                    _isBusy
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size.fromWidth(
                                  MediaQuery.of(context).size.width),
                            ),
                            onPressed: () async {
                              setState(() {
                                _isBusy = true;
                              });
                              await box.deleteAt(0);
                              setState(() {
                                _isBusy = false;
                                user == null;
                              });
                            },
                            child: const Text(
                              "Supprimer",
                            ),
                          )
                  ],
          ),
        ),
      ),
    );
  }
}
