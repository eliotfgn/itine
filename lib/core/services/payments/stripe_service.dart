import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart' as getx;
import 'package:flutter/material.dart';

class StripeService {
  Map<String, dynamic>? _paymentIntent;
  final Dio _client = Dio();

  Future<Map<String, dynamic>?> _createPaymentIntent(
      String amount, String currency) async {
    try {
      Response<Map<String, dynamic>> response = await _client.post(
        'https://api.stripe.com/v1/payment_intents',
        data: {
          'amount': amount,
          'currency': currency,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
            'Content-Type': 'application/x-www-form-urlencoded'
          },
        ),
      );

      return response.data as Map<String, dynamic>;
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<bool> makePayment(String amount) async {
    bool success = false;
    try {
      _paymentIntent = await _createPaymentIntent(amount, 'EUR');

      PaymentSheetPaymentOption? response =
          await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          billingDetails: const BillingDetails(
            name: 'Eliot Fagnon',
            email: 'eliotgaming21@gmail.com',
            phone: '+229 56759471',
            address: Address(
                city: 'Marseilles',
                country: 'France',
                line1: 'Rue 1 Madre Mia',
                line2: 'Rue 2 Padre Mio',
                postalCode: 'Postal Code',
                state: 'Statois'),
          ),
          paymentIntentClientSecret: _paymentIntent?['client_secret'],
          merchantDisplayName: 'Itine',
        ),
      );
      success = await _displayPaymentSheet();

      if (response != null) {
        print(response.label);
      }
    } catch (err) {
      success = false;
      throw Exception(err.toString());
    }

    return success;
  }

  Future<bool> _displayPaymentSheet() async {
    bool success = false;
    await Stripe.instance.presentPaymentSheet().then((value) {
      Stripe.instance.confirmPaymentSheetPayment().then((value) {
        success = true;
        getx.Get.dialog(const AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 100.0,
              ),
              SizedBox(height: 10.0),
              Text("Payment Effectué avec succès!"),
            ],
          ),
        ));
      });
    });

    return success;
  }
}
