import 'package:flutter/material.dart';

class PreferenceView extends StatefulWidget {
  const PreferenceView({super.key});

  @override
  State<PreferenceView> createState() => _PreferenceViewState();
}

class _PreferenceViewState extends State<PreferenceView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 100),
          const CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 50,
            child: Image(
              image: AssetImage("assets/icons/iconapp.png"),
              //fit: BoxFit.cover,
              height: 100,
              width: 100,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  border: Border.all(color: Colors.black45),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: const Text("terms of use",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Urbanist_bolt',
                          fontSize: 14)),
                  leading: Container(
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 40,
                    height: 40,
                    child: const Icon(
                      Icons.privacy_tip_outlined,
                      color: Colors.green,
                      size: 30,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  onTap: () {
                    // showDialog(
                    //   context: context,
                    //   builder: (context) {
                    //     return PolicyDialog(
                    //       mdFileName: 'pc.md',
                    //     );
                    //   },
                    // );
                  },
                )),
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.white10,
                //color: Theme.of(context).primaryColor,
                border: Border.all(color: Colors.black45),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                //tileColor: Colors.red.shade700,
                title: const Text("Change password",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Urbanist_bolt',
                        fontSize: 14)),
                leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.orange[200],
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      Icons.lock_outline,
                      color: Colors.orange,
                      size: 30,
                    )),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
                onTap: () {},
              )),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.white10,
                //color: Theme.of(context).primaryColor,
                border: Border.all(color: Colors.black45),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: const Text("Edit user",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Urbanist_bolt',
                        fontSize: 14)),
                leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.brown.shade300,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 30,
                    )),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
                onTap: () {},
              )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white10,
              //color: Theme.of(context).primaryColor,
              border: Border.all(color: Colors.black45),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: const Text("Connection",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(Icons.logout_rounded, size: 30)),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {},
            ),
          ),
        ],
      ),
    ));
  }
}
