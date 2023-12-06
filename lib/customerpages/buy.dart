import 'package:flutter/material.dart';
import 'package:savvy/customerpages/pay.dart';

class ScreenPay extends StatefulWidget {
  const ScreenPay({Key? key}) : super(key: key);

  @override
  State<ScreenPay> createState() => _ScreenPayState();
}

class _ScreenPayState extends State<ScreenPay> {
  String? paymentMethod;

  List<String> paymentMethods = [
    'Cash on Delivery',
    'UPI Payment',
    'Net Banking',
    'Credit/Debit/ATM Card'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        title: const Text('Payment', style: TextStyle(color: Colors.black)),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              const SizedBox(height: 10),
              const Divider(thickness: 3),
              // Create a separate group for each set of radio buttons
              buildRadioGroup('UPI'),
              buildRadioGroup('Wallets'),
              buildRadioGroup('Credit/Debit/ATM Card'),
              buildRadioGroup('Net Banking'),
              buildRadioGroup('Cash on Delivery'),
              // ... (existing code for TextFormField widgets)
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStatePropertyAll(const Size(150, 50)),
                backgroundColor: MaterialStatePropertyAll(Colors.green),
              ),
              onPressed: () {
                if (paymentMethod != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ScreenPays()),
                  );
                } else {
                  // Show an error message or handle the case where no payment method is selected
                }
              },

              child: const Text('Pay'),
            ),
          ),
          
        ],
      ),
    );
  }

  Widget buildRadioGroup(String label) {
    return ListTile(
      leading: Radio(
        value: label,
        groupValue: paymentMethod,
        onChanged: (value) {
          setState(() {
            paymentMethod = value;
          });
        },
      ),
      title: Text(label),
      trailing: const SizedBox(
        width: 100,
      ),
    );
  }
}
