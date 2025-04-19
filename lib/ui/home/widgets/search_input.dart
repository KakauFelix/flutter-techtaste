import 'package:flutter/material.dart';
import 'package:myapp/ui/_core/app_colors.dart';

class SearchInput extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final void Function(String)? onChanged;

  const SearchInput({
    super.key,
    this.controller,
    this.hintText = 'Pesquise aqui...',
    this.onChanged,
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {}); // Atualiza quando foca/desfoca
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isFocused = _focusNode.hasFocus;

    return TextFormField(
      focusNode: _focusNode,
      controller: widget.controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: 'O que você quer comer?',
        hintText: widget.hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: const Icon(Icons.search),
        labelStyle: TextStyle(
          fontSize: 18,
          color: isFocused ? AppColors.mainColor : Colors.grey,
        ),
        floatingLabelStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: isFocused ? AppColors.mainColor : Colors.grey,
        ),
        prefixIconColor: isFocused ? AppColors.mainColor : Colors.grey,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.mainColor, width: 2),
        ),
      ),
    );
  }
}
