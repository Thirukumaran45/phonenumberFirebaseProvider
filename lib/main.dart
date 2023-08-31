import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:phoneuserlogin/custumbutton.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: const MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController txtcontlr = TextEditingController();

  ///creating the instance of country_picker,and
  ///making a initial stage country picker country as india
  Country SelectCountryCode = Country(
    phoneCode: '91',
    countryCode: 'IN',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'India',
    example: 'India',
    displayName: 'India',
    displayNameNoCountryCode: 'In',
    e164Key: '',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'mobile verification',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(35),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/phone_number.jpg',
                  height: 300,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      txtcontlr.text = value;
                    });
                  },
                  enableSuggestions: false,
                  style: const TextStyle(
                      fontSize: 22, fontStyle: FontStyle.normal),
                  controller: txtcontlr,
                  autofocus: true,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      hintText: 'Enter phone number',
                      suffixIcon: txtcontlr.text.length > 9
                          ? Container(
                              margin: EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.done,
                                size: 20,
                                color: Colors.white,
                              ))
                          : null,
                      prefixIcon: Container(
                        child: InkWell(
                          /// showCountryPicker() function as the collection of
                          /// country's, and onSelect it will assign the different
                          /// country to the SelectCountryCode , because in that
                          /// we having an pre initialised Country
                          onTap: () => showCountryPicker(
                            countryListTheme: const CountryListThemeData(
                                bottomSheetHeight: 550),
                            context: context,
                            onSelect: (value) {
                              setState(() {});
                              {
                                SelectCountryCode = value;
                              }
                            },
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              '${SelectCountryCode.flagEmoji} + ${SelectCountryCode.phoneCode}',
                              style: TextStyle(fontSize: 23),
                            ),
                          ),
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: CustumButton(ontap: () {}, text: 'Verify')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
