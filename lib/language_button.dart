import 'package:flutter/material.dart';

Widget LanguageButton({
  required BuildContext context,
  required String text,
  required Function(String text) function,
  bool isActive = false,
}) {
  return Expanded(
    child: GestureDetector(
      onTap: () {
        function(text);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: isActive ? Theme.of(context).colorScheme.primary : null,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color:
                isActive ? Colors.white : Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    ),
  );
}
