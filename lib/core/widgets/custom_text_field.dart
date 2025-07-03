import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFrom extends StatefulWidget {
  const CustomTextFrom({
    super.key,
    this.onChanged,
     this.label,
     this.hint,
    this.hide = false,
    this.validator,
    this.isPasswordField = false,
    this.controller,
    this.enabel = true,
    this.icon, this.keyboardType, this.inputFormatters, this.enabled, this.onTap, this.suffixIcon,
  });
  final Widget? suffixIcon;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final String? label, hint;
  final bool hide;
  final bool? enabel;
  final String? Function(String?)? validator;
  final bool isPasswordField;
  final TextEditingController? controller;
  final Widget? icon;
  final bool? enabled;
final TextInputType? keyboardType;
final List<TextInputFormatter>? inputFormatters;
  @override
  State<CustomTextFrom> createState() => _CustomTextFromState();
}

class _CustomTextFromState extends State<CustomTextFrom> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onTap: widget.onTap,
        
        keyboardType:widget.keyboardType?? TextInputType.multiline,
inputFormatters: widget.inputFormatters,
        minLines: widget.isPasswordField ? 1 : 1,
        maxLines: widget.isPasswordField ? 1 : null,
        controller: widget.controller,
        validator:
            widget.validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return 'اكمل باقي البيانات بشكل صحيح';
              }
              return null;
            },
        onChanged: widget.onChanged,
        obscureText: widget.isPasswordField ? _isObscure : false,
        enabled: widget.enabel,
        style: const TextStyle(color: Colors.black),
        cursorColor: Colors.orange,
        decoration: InputDecoration(
      
          focusColor: Colors.black,
          filled: true,
          fillColor: Colors.white,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          label: Text(
            widget.label??'',
            style: TextStyle(
              color:  Colors.orange,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          hintText: widget.hint,
          enabled: widget.enabel ?? true,
          border: OutlineInputBorder(
            borderSide: BorderSide(color:  Colors.orange,),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          prefixIcon: widget.icon,

          suffixIcon:
              widget.isPasswordField
                  ? IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                      color:  Colors.orange,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  )
                  : null,
          hintStyle: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

final outlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.black),
  borderRadius: const BorderRadius.all(Radius.circular(16)),
);
