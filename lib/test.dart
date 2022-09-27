import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  String phone_number ="";
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            //SizedBox(height: 20,),
            IntlPhoneField(
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              initialCountryCode: 'IN',
              onChanged: (phone) {
                setState(() {
                  visible = false;
                });
                debugPrint(phone.completeNumber);
                  phone_number = phone.completeNumber;
              },
            ),

            Visibility(
                child: Text(phone_number),
              visible: visible,
            ),

            ElevatedButton(
                onPressed: (){
                  debugPrint(phone_number);
                  setState(() {
                    visible = true;
                  });
                },
                child: const Text("Afficher")
            )
          ],
        ),
      ),
    );
  }
}
