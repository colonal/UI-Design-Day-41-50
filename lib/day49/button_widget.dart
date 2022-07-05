import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final bool isEmpty;
  final double? width;
  final Widget? logo;
  const ButtonWidget(
      {required this.text,
      required this.onPressed,
      this.logo,
      this.width,
      this.isEmpty = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: isEmpty ? Colors.white : const Color(0xff3960DC),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xff3960DC)),
        boxShadow: isEmpty
            ? []
            : [
                BoxShadow(
                  color: const Color(0xff3960DC).withOpacity(0.5),
                  offset: const Offset(0, 5),
                  blurRadius: 10,
                ),
              ],
      ),
      child: MaterialButton(
        minWidth: 150,
        onPressed: onPressed,
        child: logo == null
            ? Text(
                text,
                style: TextStyle(
                  color: isEmpty ? const Color(0xff3960DC) : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  logo!,
                  const SizedBox(width: 10),
                  Text(
                    text,
                    style: TextStyle(
                      color: isEmpty ? const Color(0xff3960DC) : Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
