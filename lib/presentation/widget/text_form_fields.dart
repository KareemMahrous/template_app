import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/core.dart';
import 'widget.dart';

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
  final bool isLightMode;
  final IconData? obscuredIcon;
  final IconData? deobscuredIcon;

  const TextFormFieldPassword({
    super.key,
    this.radius = 8,
    this.borderColor = AppColors.black,
    this.prefixIcon,
    this.suffixIcon = Icons.visibility_sharp,
    this.focusedBorderColor = AppColors.black,
    this.iconColor,
    this.validator,
    this.onChanged,
    required this.controller,
    this.hintText,
    this.isLightMode = true,
    this.obscuredIcon,
    this.deobscuredIcon,
  });

  @override
  State<TextFormFieldPassword> createState() => _TextFormFieldPasswordState();
}

class _TextFormFieldPasswordState extends State<TextFormFieldPassword> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUnfocus,
      cursorColor: widget.focusedBorderColor,
      controller: widget.controller,
      decoration: InputDecoration(
        hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 12,
              color: AppColors.grey,
            ),
        hintText: widget.hintText ?? context.tr.password,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius!),
            borderSide: BorderSide(color: widget.borderColor!, width: 1.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius!),
          borderSide: BorderSide(color: widget.focusedBorderColor!, width: 1.0),
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
          icon: Transform.flip(
            flipX: true,
            child: Icon(
              _obscureText ? widget.obscuredIcon : widget.deobscuredIcon,
              color: widget.iconColor,
              size: 14,
            ),
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
                  ? '.برجاء إضافة كلمة المرور'
                  : 'Password is required.';
            } else if (value.length < 8) {
              return Localizations.localeOf(context).toString() == "ar"
                  ? 'كلمة المرور يجب أن تكون على الأقل 8 خانات'
                  : 'Password must be at least 8 characters';
              // } else if (!Validations.isPasswordValid(value)) {
              //   return Localizations.localeOf(context).toString() == "ar"
              //       ? 'كلمة المرور يجب أن تحتوي على حرف كبير وصغير ورقم ورمز خاص على الأقل'
              //       : 'Password must contain at least one uppercase letter, one lowercase letter, one number and one special character';
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
    this.radius = 8,
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
      autovalidateMode: AutovalidateMode.onUnfocus,
      cursorColor: focusedBorderColor,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: AppColors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w400),
        hintText: context.tr.email,
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
  final List<TextInputFormatter>? inputFormatters;

  const TextFormFieldCustom({
    super.key,
    this.radius = 8,
    this.borderColor = AppColors.grey,
    this.prefixIcon,
    this.focusedBorderColor = AppColors.grey,
    this.validator,
    this.onChanged,
    required this.controller,
    required this.hintText,
    this.validatorMessage,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUnfocus,
      cursorColor: focusedBorderColor,
      controller: controller,
      inputFormatters: inputFormatters,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 12,
              color: AppColors.grey,
            ),
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
    this.radius = 8,
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
      autovalidateMode: AutovalidateMode.onUnfocus,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      controller: controller,
      cursorColor: focusedBorderColor,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 12,
              color: AppColors.grey,
            ),
        hintText: Localizations.localeOf(context).toString() == "ar"
            ? "رقم الهاتف"
            : "Phone Number",
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.zero,
                bottomRight: Radius.circular(radius!),
                topLeft: Radius.zero,
                topRight: Radius.circular(radius!)),
            borderSide: BorderSide(color: focusedBorderColor!)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.zero,
              bottomRight: Radius.circular(radius!),
              topLeft: Radius.zero,
              topRight: Radius.circular(radius!)),
          borderSide: BorderSide(color: focusedBorderColor!),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.zero,
                bottomRight: Radius.circular(radius!),
                topLeft: Radius.zero,
                topRight: Radius.circular(radius!)),
            borderSide: BorderSide(color: focusedBorderColor!)),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.zero,
              bottomRight: Radius.circular(radius!),
              topLeft: Radius.zero,
              topRight: Radius.circular(radius!)),
          borderSide: const BorderSide(color: AppColors.redColor, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.zero,
              bottomRight: Radius.circular(radius!),
              topLeft: Radius.zero,
              topRight: Radius.circular(radius!)),
          borderSide: const BorderSide(color: AppColors.redColor),
        ),
      ),
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return Localizations.localeOf(context).toString() == "ar"
                  ? 'برجاء إضافة رقم الهاتف'
                  : 'Phone number is required.';
              // }
              // else if (!Validations.isPhoneValid(value)) {
              //   return Localizations.localeOf(context).toString() == "ar"
              //       ? 'صيغة رقم الهاتف غير صحيحة'
              //       : 'Invalid phone number format.';
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
    this.radius = 8,
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
      autovalidateMode: AutovalidateMode.onUnfocus,
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
            }
            final regex = RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$');
            if (!regex.hasMatch(value)) {
              return Localizations.localeOf(context).toString() == "ar"
                  ? "برجاء ادخال الاسم الكامل بشكل صحيح"
                  : "Please enter a valid full name";
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
    this.radius = 8,
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
        hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColors.lightPrimaryColor),
        hintText: Localizations.localeOf(context).toString() == "ar"
            ? "بحث..."
            : "Search...",
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius!),
          borderSide: BorderSide(color: focusedBorderColor!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius!),
          borderSide: BorderSide(color: borderColor!),
        ),
      ),
      onChanged: onChanged,
    );
  }
}

class MenuDropDown<T> extends StatelessWidget {
  const MenuDropDown({
    super.key,
    this.radius = 8,
    this.borderColor = AppColors.black,
    this.focusedBorderColor = AppColors.black,
    required this.value,
    required this.items,
    this.onSelected,
    this.validator,
    required this.controller,
    this.hintText,
    this.initSelection,
  });
  final double? radius;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final T? value;
  final List<DropdownMenuEntry<T>> items;
  final void Function(T?)? onSelected;
  final String? Function(T?)? validator;
  final TextEditingController controller;
  final String? hintText;
  final T? initSelection;
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<T>(
      enableSearch: true,
      controller: controller,
      searchCallback: (List<DropdownMenuEntry<T>> entries, String query) {
        if (query.isEmpty) {
          return null;
        }
        final int index = entries
            .indexWhere((DropdownMenuEntry<T> entry) => entry.label == query);
        return index;
      },
      selectedTrailingIcon: Transform.rotate(
          angle: 3.14 * 1 / 2,
          child: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.lightPrimaryColor,
          )),
      trailingIcon: Transform.rotate(
          angle: 3.14 * 3 / 2,
          child: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.lightPrimaryColor,
          )),
      width: context.w,
      requestFocusOnTap: true,
      hintText: hintText,
      enableFilter: true,
      inputDecorationTheme: ThemeData.light().inputDecorationTheme.copyWith(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius!),
                borderSide: BorderSide(color: borderColor!)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius!),
              borderSide: BorderSide(color: focusedBorderColor!),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius!),
                borderSide: BorderSide(color: borderColor!)),
          ),
      menuStyle: MenuStyle(
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              side: const BorderSide(color: AppColors.black),
              borderRadius: BorderRadius.all(Radius.circular(radius!))))),
      onSelected: onSelected,
      dropdownMenuEntries: items,
      initialSelection: initSelection,
      menuHeight: context.h * 0.3,
    );
  }
}

class TextFormFieldDropDown extends StatelessWidget {
  const TextFormFieldDropDown({
    super.key,
    required this.value,
    required this.items,
    this.radius = 8,
    this.borderColor = AppColors.grey,
    this.focusedBorderColor = AppColors.black,
    this.validator,
    this.onChanged,
    this.hintText,
  });

  final String? value;
  final List<String> items;
  final double? radius;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      hint: hintText != null
          ? DefaultText(
              hintText!,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            )
          : null,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius!),
              borderSide: BorderSide(color: borderColor!)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius!),
            borderSide: BorderSide(color: focusedBorderColor!),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius!),
            borderSide: const BorderSide(color: AppColors.redColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius!),
            borderSide: const BorderSide(color: AppColors.redColor),
          )),
      value: value,
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: DefaultText(item),
        );
      }).toList(),
      onChanged: onChanged,
      validator: validator,
      icon: Transform.rotate(
          angle: 3.14 * 3 / 2,
          child: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.lightPrimaryColor,
          )),
    );
  }
}

class TextFormFieldDatePicker extends StatelessWidget {
  const TextFormFieldDatePicker({
    super.key,
    required this.dateController,
    this.onTap,
    this.radius = 8,
    this.borderColor = AppColors.grey,
    this.focusedBorderColor = AppColors.black,
    this.suffixIcon,
    this.hintText,
  });
  final TextEditingController dateController;
  final Function()? onTap;
  final double radius;
  final Color borderColor;
  final Color focusedBorderColor;
  final Widget? suffixIcon;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: focusedBorderColor,
      controller: dateController,
      autovalidateMode: AutovalidateMode.onUnfocus,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 12,
              color: AppColors.grey,
            ),
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: borderColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(color: AppColors.redColor)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: focusedBorderColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(color: AppColors.redColor),
        ),
      ),
      readOnly: true,
      onTap: onTap,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return context.tr.fieldRequired;
        }
        return null;
      },
    );
  }
}


/// requires Package [phone_form_field] to be installed
/// see: https://pub.dev/packages/phone_form_field

// class TextFormFieldPhoneWithCountryCode extends StatelessWidget {
//   const TextFormFieldPhoneWithCountryCode({
//     super.key,
//     required this.phoneNumberController,
//     this.radius = 8,
//     this.borderColor = AppColors.black,
//     this.focusedBorderColor = AppColors.black,
//   });

//   final PhoneController phoneNumberController;
//   final double radius;
//   final Color borderColor;
//   final Color focusedBorderColor;

//   @override
//   Widget build(BuildContext context) {
//     return PhoneFormField(
//       decoration: InputDecoration(
//         enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(radius),
//             borderSide: BorderSide(color: borderColor)),
//         errorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(radius),
//             borderSide: const BorderSide(color: AppColors.redColor)),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(radius),
//           borderSide: BorderSide(color: focusedBorderColor),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(radius),
//           borderSide: const BorderSide(color: AppColors.redColor),
//         ),
//       ),
//       validator: PhoneValidator.compose([
//         PhoneValidator.required(context,
//             errorText: Localizations.localeOf(context).toString() == "ar"
//                 ? 'برجاء إضافة رقم الهاتف'
//                 : 'Phone number is required.'),
//         PhoneValidator.validMobile(context, errorText: context.tr.invalidValue),
//       ]),
//       countrySelectorNavigator: const CountrySelectorNavigator.dialog(),
//       enabled: true,
//       isCountrySelectionEnabled: true,
//       isCountryButtonPersistent: true,
//       countryButtonStyle: const CountryButtonStyle(
//           showDialCode: true, showIsoCode: true, showFlag: true, flagSize: 16),
//       controller: phoneNumberController,
//     );
//   }
// }
