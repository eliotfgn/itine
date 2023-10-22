import 'package:flutter/material.dart';
import 'package:itine/presentation/widgets/common/CustomTextFormField.dart';

class AddressForm extends StatefulWidget {
  const AddressForm({super.key});

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _rueController = TextEditingController();
  final TextEditingController _addressSupController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          hint: 'Nom complet',
          visible: true,
          controller: _nameController,
          radius: 10,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextFormField(
          hint: 'Rue',
          visible: true,
          controller: _rueController,
          radius: 10,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextFormField(
          hint: 'Addresse complémentaire',
          visible: true,
          controller: _addressSupController,
          radius: 10,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextFormField(
          hint: 'Code postal',
          visible: true,
          controller: _postalCodeController,
          radius: 10,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextFormField(
          hint: 'Ville',
          visible: true,
          controller: _cityController,
          radius: 10,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
