import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /// Une clée qui va nous permettre de gérer notre
  /// formulaire
  final _formKey = GlobalKey<FormState>();

  /// Les controllers qui vont nous servir à recueillir
  /// les entrées de l'utilisateur
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize:
                        Size.fromWidth(MediaQuery.of(context).size.width)),
                onPressed: () {},
                child: const Text(
                  "Enregister",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
