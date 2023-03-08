import 'package:direct_me/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:direct_me/Provider/country_provider.dart';
import 'package:direct_me/screens/Dashboard/strings.dart';

class CountryPicker extends StatelessWidget {
  const CountryPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showCountryPicker(
          context: context,
          searchAutofocus: true,
          useSafeArea: true,
          //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
          exclude: <String>['KN', 'MF'],
          favorite: <String>['IN', 'US', 'CA', 'AU'],
          //Optional. Shows phone code before the country name.
          showPhoneCode: true,
          onSelect: (Country country) {
            context.read<CountryProvider>().setPhoneCode(country.phoneCode);
            context.read<CountryProvider>().setCountryCode(country.countryCode);
          },
          // Optional. Sets the theme for the country list picker.
          countryListTheme: CountryListThemeData(
            bottomSheetHeight: MediaQuery.of(context).size.height * 0.8,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
            // Optional. Styles the search field.
            inputDecoration: InputDecoration(
              labelText: STRINGS.SEARCH,
              hintText: STRINGS.SELECT_THE_COUNTRY,
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: CUSTOM_COLOR.PRIMARY.withOpacity(0.2),
                ),
              ),
            ),
            // Optional. Styles the text in the search field
            searchTextStyle: const TextStyle(
              color: CUSTOM_COLOR.PRIMARY,
              fontSize: 18,
            ),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.watch<CountryProvider>().countryCode,
            style: GoogleFonts.poppins(
              fontSize: 14,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            '+${context.watch<CountryProvider>().phoneCode}',
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
