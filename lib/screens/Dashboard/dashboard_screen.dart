import 'package:direct_me/constants/colors.dart';
import 'package:direct_me/controller/url.dart';
import 'package:direct_me/screens/Dashboard/components/countrycode_picker.dart';
import 'package:direct_me/screens/Dashboard/components/input_text.dart';
import 'package:direct_me/screens/Dashboard/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:direct_me/Provider/app_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Dashboard extends StatelessWidget {
  final String title;
  const Dashboard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    Future<void> _launchUrl() async {
      var url = Uri.parse(
          "${URL.WHATSAPP_LINK}+${context.read<CustomProvider>().phoneCode}${context.read<CustomProvider>().phoneNumber}");
      if (!await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      )) {
        throw Exception('Could not launch ');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CountryPicker(),
                SizedBox(
                  width: 10,
                ),
                InputNumber()
              ],
            ),
            GestureDetector(
              onTap: context.watch<CustomProvider>().phoneNumber.length >= 10
                  ? _launchUrl
                  : null,
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 40,
                  decoration: BoxDecoration(
                    color:
                        context.watch<CustomProvider>().phoneNumber.length >= 10
                            ? CUSTOM_COLOR.PRIMARY
                            : CUSTOM_COLOR.DISABLE.shade500,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      STRINGS.SEND,
                      style: TextStyle(
                          color: context
                                      .watch<CustomProvider>()
                                      .phoneNumber
                                      .length >=
                                  10
                              ? CUSTOM_COLOR.BACKGROUND_COLOR
                              : CUSTOM_COLOR.BACKGROUND_COLOR),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
