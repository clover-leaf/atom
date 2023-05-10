import 'package:atom/gen/assets.gen.dart';
import 'package:atom/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class TPasswordField extends StatefulWidget {
  const TPasswordField({
    super.key,
    required this.initText,
    required this.labelText,
    required this.onChanged,
    required this.validator,
    this.picture,
    this.enabled = true,
    this.hasDelete = false,
  });

  final String labelText;
  final String? initText;
  final SvgGenImage? picture;
  final void Function(String) onChanged;
  final String? Function(String?)? validator;
  final bool enabled;
  final bool hasDelete;

  @override
  State<TPasswordField> createState() => _TPasswordFieldState();
}

class _TPasswordFieldState extends State<TPasswordField> {
  late TextEditingController _controller;
  late bool visible;
  late bool hasFocus;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    if (widget.initText != null) {
      _controller.text = widget.initText!;
    }
    visible = true;
    hasFocus = false;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Focus(
      onFocusChange: (focus) => setState(() {
        hasFocus = focus;
      }),
      child: TextFormField(
        validator: (value) {
          if (hasFocus) {
            return null;
          } else {
            return widget.validator?.call(value);
          }
        },
        obscureText: visible,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.visiblePassword,
        controller: _controller,
        onChanged: widget.onChanged,
        cursorColor: ColorName.sky300,
        style: textTheme.bodyMedium!.copyWith(
          color: ColorName.neural700,
          fontWeight: FontWeight.w600,
        ),
        enabled: widget.enabled,
        // prefix icon
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          errorStyle: textTheme.bodyMedium!.copyWith(color: ColorName.wine300),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 56,
          ),
          prefixIcon: widget.picture != null
              ? widget.picture!.svg(
                  fit: BoxFit.scaleDown,
                  color: widget.enabled
                      ? ColorName.neural600
                      : ColorName.neural500,
                )
              : const SizedBox.shrink(),
          suffixIcon: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              setState(() {
                visible = !visible;
              });
            },
            child: visible
                ? Assets.icons.eyeSlash.svg(
                    color: ColorName.neural600,
                    fit: BoxFit.scaleDown,
                  )
                : Assets.icons.eye.svg(
                    color: ColorName.neural600,
                    fit: BoxFit.scaleDown,
                  ),
          ),
          // background
          filled: true,
          fillColor: hasFocus ? ColorName.neural300 : ColorName.neural200,
          // label
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelText: widget.labelText,
          labelStyle: textTheme.bodyMedium!.copyWith(
            color: hasFocus
                ? (widget.enabled ? ColorName.neural600 : ColorName.sky300)
                : (widget.enabled ? ColorName.neural600 : ColorName.neural400),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            borderSide: BorderSide(color: ColorName.neural500, width: 3),
          ),
          disabledBorder: const UnderlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            borderSide: BorderSide(color: ColorName.neural300, width: 3),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            borderSide: BorderSide(color: ColorName.neural400, width: 3),
          ),
          errorBorder: const UnderlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            borderSide: BorderSide(color: ColorName.wine300, width: 3),
          ),
        ),
      ),
    );
  }
}
