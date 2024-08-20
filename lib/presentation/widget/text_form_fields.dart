import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/core.dart';

class TextFormFieldPassword extends StatefulWidget {
  final double? radius;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final Color? iconColor;
  final String? hintText;
  final TextEditingController controller;

  const TextFormFieldPassword({
    super.key,
    this.radius = 10,
    this.borderColor = AppColors.black,
    this.prefixIcon,
    this.suffixIcon = Icons.visibility_sharp,
    this.focusedBorderColor = AppColors.black,
    this.iconColor,
    this.validator,
    this.onChanged,
    required this.controller,
    this.hintText,
  });

  @override
  State<TextFormFieldPassword> createState() => _TextFormFieldPasswordState();
}

class _TextFormFieldPasswordState extends State<TextFormFieldPassword> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: widget.focusedBorderColor,
      controller: widget.controller,
      decoration: InputDecoration(
        hintStyle: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: AppColors.black),
        hintText: widget.hintText ??
            (Localizations.localeOf(context).toString() == "ar"
                ? "كلمة المرور"
                : "Password"),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius!),
            borderSide: BorderSide(color: widget.borderColor!)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius!),
          borderSide: BorderSide(color: widget.focusedBorderColor!),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius!),
          borderSide: const BorderSide(color: AppColors.redColor, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius!),
          borderSide: const BorderSide(color: AppColors.redColor),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: widget.iconColor,
            size: 18,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      validator: widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return Localizations.localeOf(context).toString() == "ar"
                  ? 'برجاء إضافة كلمة المرور'
                  : 'Password is required.';
            } else {
              return null;
            }
          },
      obscureText: _obscureText,
      onChanged: widget.onChanged,
    );
  }
}

class TextFormFieldEmail extends StatelessWidget {
  final double? radius;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final TextEditingController controller;
  const TextFormFieldEmail({
    super.key,
    this.radius = 10,
    this.borderColor = AppColors.grey,
    this.prefixIcon,
    this.focusedBorderColor = AppColors.grey,
    this.validator,
    this.onChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: focusedBorderColor,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintStyle: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: AppColors.black26),
        hintText: Localizations.localeOf(context).toString() == "ar"
            ? "البريد الإلكتروني"
            : "Email",
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius!),
            borderSide: BorderSide(color: borderColor!, width: 1.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius!),
          borderSide: BorderSide(color: focusedBorderColor!, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius!),
          borderSide: const BorderSide(color: AppColors.redColor, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius!),
          borderSide: const BorderSide(color: AppColors.redColor),
        ),
      ),
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return Localizations.localeOf(context).toString() == "ar"
                  ? 'برجاء إضافة البريد الإلكتروني'
                  : 'Email is required.';
            } else if (!Validations.isEmailValid(value)) {
              return Localizations.localeOf(context).toString() == "ar"
                  ? 'صيغة البريد الإلكتروني غير صحيحة'
                  : 'Invalid email format.';
            } else {
              return null;
            }
          },
      onChanged: onChanged,
    );
  }
}

class TextFormFieldCustom extends StatelessWidget {
  final double? radius;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final TextEditingController controller;
  final String hintText;

  final String? validatorMessage;

  const TextFormFieldCustom({
    super.key,
    this.radius = 10,
    this.borderColor = AppColors.grey,
    this.prefixIcon,
    this.focusedBorderColor = AppColors.grey,
    this.validator,
    this.onChanged,
    required this.controller,
    required this.hintText,
    this.validatorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: focusedBorderColor,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintStyle: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: AppColors.black26),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius!),
            borderSide: BorderSide(color: borderColor!, width: 1.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius!),
          borderSide: BorderSide(color: focusedBorderColor!, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius!),
          borderSide: const BorderSide(color: AppColors.redColor, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius!),
          borderSide: const BorderSide(color: AppColors.redColor),
        ),
      ),
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return validatorMessage;
            } else {
              return null;
            }
          },
      onChanged: onChanged,
    );
  }
}

class TextFormFieldPhone extends StatelessWidget {
  final double? radius;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final TextEditingController controller;

  const TextFormFieldPhone({
    super.key,
    this.radius = 10,
    this.borderColor = AppColors.black,
    this.prefixIcon,
    this.focusedBorderColor = AppColors.black,
    this.validator,
    this.onChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(11),
      ],
      controller: controller,
      cursorColor: focusedBorderColor,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintStyle: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: AppColors.black26),
        hintText: Localizations.localeOf(context).toString() == "ar"
            ? "رقم الهاتف"
            : "Phone Number",
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius!),
            borderSide: BorderSide(color: focusedBorderColor!)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius!),
          borderSide: BorderSide(color: focusedBorderColor!),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius!),
            borderSide: BorderSide(color: focusedBorderColor!)),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius!),
          borderSide: const BorderSide(color: AppColors.redColor, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius!),
          borderSide: const BorderSide(color: AppColors.redColor),
        ),
      ),
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return Localizations.localeOf(context).toString() == "ar"
                  ? 'برجاء إضافة رقم الهاتف'
                  : 'Phone number is required.';
            } else if (Validations.isPhoneValid(value)) {
              return Localizations.localeOf(context).toString() == "ar"
                  ? 'صيغة رقم الهاتف غير صحيحة'
                  : 'Invalid phone number format.';
            } else {
              return null;
            }
          },
      onChanged: onChanged,
    );
  }
}

class TextFormFieldFullName extends StatelessWidget {
  final double? radius;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final TextEditingController controller;

  final String hintText;

  const TextFormFieldFullName({
    super.key,
    this.radius = 10,
    this.borderColor = AppColors.black,
    this.suffixIcon,
    this.focusedBorderColor = AppColors.black,
    this.validator,
    this.onChanged,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      cursorColor: focusedBorderColor,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintStyle: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: AppColors.black26),
        hintText: hintText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius!),
            borderSide: BorderSide(color: borderColor!)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius!),
            borderSide: BorderSide(color: borderColor!)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius!),
          borderSide: BorderSide(color: focusedBorderColor!),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius!),
          borderSide: const BorderSide(color: AppColors.redColor, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius!),
          borderSide: const BorderSide(color: AppColors.redColor),
        ),
      ),
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return Localizations.localeOf(context).toString() == "ar"
                  ? 'برجاء اضافة الاسم الكامل'
                  : 'Full name is required.';
            } else {
              return null;
            }
          },
      onChanged: onChanged,
    );
  }
}

class TextFormFieldSearch extends StatelessWidget {
  const TextFormFieldSearch({
    super.key,
    this.radius = 10,
    this.borderColor = AppColors.grey,
    this.suffixIcon,
    this.focusedBorderColor = AppColors.black,
    this.validator,
    this.onChanged,
    required this.controller,
    this.icon,
    this.isPrefix = false,
  });
  final Widget? icon;
  final double? radius;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final TextEditingController controller;
  final bool isPrefix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.disabled,
      controller: controller,
      cursorColor: focusedBorderColor,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: isPrefix ? icon ?? const Icon(Icons.search) : null,
        suffixIcon: isPrefix ? null : icon ?? const Icon(Icons.search),
        hintStyle: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: AppColors.black87),
        hintText: Localizations.localeOf(context).toString() == "ar"
            ? "بحث"
            : "Search",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius!),
            borderSide: BorderSide(color: borderColor!)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius!),
          borderSide: BorderSide(color: focusedBorderColor!),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
