import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppSearchField extends StatelessWidget {
  const AppSearchField({
    this.controller,
    this.hint,
    this.inputformatters,
    this.onChange,
    this.onSubmit,
    this.inputAction = TextInputAction.next,
    this.enableTopBottomGap = true,
    this.validator,
    this.fieldEnabled,
    super.key,
  });

  final String? hint;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputformatters;
  final Function(String)? onChange;
  final Function(String)? onSubmit;
  final TextInputAction? inputAction;
  final bool enableTopBottomGap;
  final FormFieldValidator<String>? validator;
  final bool? fieldEnabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: TextFormField(
        cursorColor: Colors.black,
        inputFormatters: inputformatters,
        controller: controller,
        onChanged: onChange,
        onFieldSubmitted: onSubmit,
        textInputAction: inputAction,
        validator: validator,
        enabled: fieldEnabled,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hint ?? '',
          hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
              ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          prefixIcon: const Icon(Icons.search),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
