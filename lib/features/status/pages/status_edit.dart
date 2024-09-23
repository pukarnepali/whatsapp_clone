import 'package:flutter/material.dart';

class WhatsappStatusEdit extends StatefulWidget {
  const WhatsappStatusEdit({super.key});

  @override
  State<WhatsappStatusEdit> createState() => _WhatsappStatusEditState();
}

class _WhatsappStatusEditState extends State<WhatsappStatusEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC1A0AD),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/icons/cross.png",
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        "T",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 27,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Image.asset("assets/icons/color_plate.png")
                    ],
                  )
                ],
              ),
              const Expanded(
                child: Center(
                  child: TextField(
                    style: TextStyle(color: Colors.white, fontSize: 40),
                    decoration: InputDecoration(
                        hintText: "Type a Status",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 40),
                        border: InputBorder.none),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
