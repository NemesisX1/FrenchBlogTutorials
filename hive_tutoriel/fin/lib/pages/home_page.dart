import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:hive_tutoriel/models/app_user.dart';
import 'package:hive_tutoriel/pages/infos_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Une clée qui va nous permettre de gérer notre
  /// formulaire
  final _formKey = GlobalKey<FormState>();

  /// Les controllers qui vont nous servir à recueillir
  /// les entrées de l'utilisateur
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isBusy = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Connexion"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  hintText: "Nom d'utilisateur",
                ),
                // Pour éviter que les gens soient vides
                validator: (value) {
                  if (value!.isEmpty) return "Ce champs ne peut être vide";
                  return null;
                },
              ),
              const Gap(10),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  hintText: "Mot de passe",
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) return "Ce champs ne peut être vide";
                  return null;
                },
              ),
              const Gap(20),
              _isBusy
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isBusy = true;
                          });

                          AppUser user = AppUser(
                            username: _usernameController.text,
                            password: _passwordController.text,
                          );

                          Box<AppUser> box = Hive.box('user');
                          if (box.isNotEmpty) {
                            await box.putAt(0, user);
                          } else {
                            await box.add(user);
                          }

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const InfosPage(),
                            ),
                          );
                          setState(() {
                            _isBusy = false;
                          });
                        }
                      },
                      child: const Text(
                        "Enregister",
                      ),
                    ),
              const Gap(30),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const InfosPage(),
                    ),
                  );
                },
                child: const Text("Voir user"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
