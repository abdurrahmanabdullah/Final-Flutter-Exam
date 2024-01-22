import 'package:exam_2/ui/shared/app_colors.dart';
import 'package:exam_2/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    @required this.textFieldLabel,
    this.typeKeyboard,
    this.passwordField = false,
    this.onChange,
    this.textLengthSize = 200,
    this.noBottomPadding = false,
    this.leadingIcon,
    this.trialWidget,
    this.trialIconOnTap,
    this.prefixText = '',
    this.isLastField = false,
    this.formValidator,
    this.initialValue,
    this.enabled = true,
    this.autoFocus = false,
    this.isSmall = false,
    this.controller,
  }) : super(key: key);

  final String? textFieldLabel;
  final TextInputType? typeKeyboard;
  final bool passwordField;
  final Function(String s)? onChange;
  final int textLengthSize;
  final bool noBottomPadding;
  final IconData? leadingIcon;
  final Widget? trialWidget;
  final VoidCallback? trialIconOnTap;
  final String prefixText;
  final bool isLastField;
  final String? Function(String?)? formValidator;
  final String? initialValue;
  final bool enabled;
  final bool autoFocus;
  final bool isSmall;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: UIHelper.deviceWidth(context) > UIHelper.deviceHeight(context)
            ? UIHelper.deviceWidth(context) * 0.6
            : UIHelper.deviceWidth(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            autofocus: autoFocus,
            enabled: enabled,
            controller: controller,
            validator: formValidator,
            onChanged: onChange,
            obscureText: passwordField,
            keyboardType: typeKeyboard,
            initialValue: initialValue,
            style: Theme.of(context).textTheme.bodyText2,
            inputFormatters: [
              LengthLimitingTextInputFormatter(textLengthSize),
            ],
            cursorColor: kMainColor,
            textInputAction:
                isLastField ? TextInputAction.done : TextInputAction.next,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  vertical: isSmall ? 0 : 18.0, horizontal: 16.0),
              errorStyle: const TextStyle(fontSize: 9, height: 0.1),
              prefix: Text(
                prefixText,
                style: const TextStyle(
                  color: kTextMainColor,
                ),
              ),
              prefixIcon: leadingIcon != null
                  ? Icon(
                      leadingIcon,
                      color: kMainColor,
                    )
                  : null,
              suffixIcon: trialWidget == null
                  ? null
                  : GestureDetector(
                      onTap: trialIconOnTap,
                      child: SizedBox(
                        height: 32,
                        width: 32,
                        child: trialWidget,
                      ),
                    ),
              labelText: textFieldLabel,
              labelStyle: const TextStyle(
                color: kTextSecondaryColor,
              ),
              filled: true,
              fillColor: kMainColor.withOpacity(0.16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: kMainColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: kMainColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: kMainColor),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: kRedSignalColor),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: kRedSignalColor),
              ),
            ),
          ),
          noBottomPadding
              ? Container()
              : const SizedBox(
                  height: 16.0,
                )
        ],
      ),
    );
  }
}
