import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rlt/transalations/codegen_loader.g.dart';
import 'package:rlt/transalations/locale_keys.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      path: 'assets',
      child: const RTLApp()));
}

class RTLApp extends StatefulWidget {
  const RTLApp({super.key});

  @override
  State<RTLApp> createState() => _RTLAppState();
}

class _RTLAppState extends State<RTLApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('RTL App'),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  const Icon(Icons.person),
                  Text(LocaleKeys.hello_welcome_to_my_app.tr()),
                  const Icon(Icons.location_city_sharp),
                ],
              ),

              // Two button to switch between languages en and ar
              ElevatedButton(
                onPressed: () {
                  context.setLocale(const Locale('en'));
                  setState(() {});
                },
                child: const Text('English'),
              ),

              ElevatedButton(
                onPressed: () {
                  context.setLocale(const Locale('ar'));
                  setState(() {});
                },
                child: const Text('Arabic'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//To generate the codegen_loader.g.dart file, run the following command:
// flutter pub run easy_localization:generate -S "assets" -O "lib/transalations"  
//
// To generate the json Keys files, run the following command:
//flutter pub run easy_localization:generate -S "assets" -O "lib/transalations" -o "locale_keys.g.dart" -f keys  