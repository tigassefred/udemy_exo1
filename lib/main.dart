import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 12, 68, 114)),
        useMaterial3: true,
      ),
      home: const BasicPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BasicPage extends StatelessWidget {
  const BasicPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "Facebook Profile",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset('images/cover.jpg',
                      height: 200, fit: BoxFit.cover),
                  Padding(
                    padding: const EdgeInsets.only(top: 140),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.white,
                      child: profileImage(radius: 69),
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Spacer(),
                  Text(
                    "Frederic TIGASSE",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  Spacer()
                ],
              ),
              const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                      "Un jours les chats dominerons le monde, mais aujourd'hui c'est l'heurs de la sieste",
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.grey),
                      textAlign: TextAlign.center)),
              Row(
                children: [
                  Expanded(child: buttonContainer(text: "Modifier le profile")),
                  buttonContainer(icon: Icons.border_color)
                ],
              ),
              const Divider(thickness: 2),
              sectionTitleText('A Propos de moi'),
              aboutRow(icon: Icons.house, text: "Notre vile"),
              aboutRow(icon: Icons.work, text: "Develppeur flutter"),
              aboutRow(icon: Icons.favorite, text: "En couple avec mon chat"),
              const Divider(thickness: 2),
              sectionTitleText('Mes Amis'),
              allFriend(width / 3.5),
              const Divider(thickness: 2),
              sectionTitleText('Mes Posts'),
            ],
          ),
        ));
  }

  CircleAvatar profileImage({required double radius}) {
    return CircleAvatar(
        radius: radius,
        backgroundImage: const AssetImage('images/profile.jpg'));
  }

  Container buttonContainer({IconData? icon, String? text}) {
    return Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue,
        ),
        height: 50,
        child: (icon == null)
            ? Center(
                child: Text(text ?? "",
                    style: const TextStyle(color: Colors.white)))
            : Icon(
                icon,
                color: Colors.white,
              ));
  }

  Widget sectionTitleText(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 7, bottom: 1.5),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
      ),
    );
  }

  Widget aboutRow({required IconData icon, required String text}) {
    return Row(
      children: [
        Padding(padding: const EdgeInsets.only(left: 5) , child: Icon(icon)),
        Padding(
          padding: const EdgeInsets.only(left:5, bottom: 4),
          child: Text(text),
        )
      ],
    );
  }

  Widget frienchImage(String name, String paths, double width) {
    return Column(children: [
      Container(
        width: width,
        height: width,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(paths),fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [BoxShadow(color: Colors.grey)],
            color: Colors.white),
      ),
      Text(name),
    ]);
  }

  Row allFriend(double width) {
    Map<String, String> friends = {
      "Josue": "images/cat.jpg",
      "Maggy": "images/sunflower.jpg",
      "daffy": "images/duck.jpg",
    };
    List<Widget> children = [];
    friends.forEach((name, paths) {
      children.add(frienchImage(name, paths, width));
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: children,
    );
  }
}
