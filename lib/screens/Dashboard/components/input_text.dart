import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../strings.dart';

import 'package:direct_me/Provider/app_provider.dart';

class InputNumber extends StatelessWidget {
  const InputNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        onChanged: (phoneNumber) {
          context.read<CustomProvider>().setPhoneNumber(phoneNumber);
        },
        controller: context.read<CustomProvider>().myController,
        keyboardType: TextInputType.number,
        autofocus: true,
        decoration: InputDecoration(
          labelText: STRINGS.ENTER_THE_NUMBER,
          border: InputBorder.none,
          labelStyle: TextStyle(
            color: Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
