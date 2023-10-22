import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:itine/presentation/ui/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey =
      'pk_test_51O0knNGzp7vUnYy5zZcuOWyMdGwUM7DV9rCh9FphMj44Tf8r1H3QzvOt96URvjCByWsIln2st8M3QDAvV9KrHLgp00ovRoO2j4';

  await dotenv.load(fileName: 'assets/.env');

  runApp(const App());
}
