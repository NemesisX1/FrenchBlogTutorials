import 'package:flutter/material.dart';

class InfosPage extends StatefulWidget {
  const InfosPage({
    Key? key,
  }) : super(key: key);

  @override
  State<InfosPage> createState() => _InfosPageState();
}

class _InfosPageState extends State<InfosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes infos"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
              ),
              onPressed: () {},
              child: const Text(
                "Supprimer",
              ),
            )
          ],
        ),
      ),
    );
  }
}
