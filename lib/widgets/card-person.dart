import 'package:flutter/material.dart';

class CardPerson extends StatelessWidget {
  const CardPerson({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.lightGreen,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 47, 47, 47),
            offset: Offset(3, 2),
            blurRadius: 4
          )
        ]
      ),
      child: ListTile(
        title: Column(
          children: [
            Text("Angelo Granados Barreda", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("dwedwe", style: TextStyle(fontSize: 13)),
                Text("bgtervre", style: TextStyle(fontSize: 13))
              ],
            )
          ],
        ),
        leading: Icon(Icons.person_2_outlined),
        trailing: Checkbox(value: false, onChanged: (value){}),
      )
    );
  }
}