import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReusableBars extends StatefulWidget {
  final String text;
  final SvgPicture icons;
  final Function method;

  const ReusableBars(
      {Key? key, required this.icons, required this.text, required this.method})
      : super(key: key);

  @override
  State<ReusableBars> createState() => _ReusableBarsState();
}

class _ReusableBarsState extends State<ReusableBars> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: GestureDetector(
        onTap: () {
          widget.method();
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.white, width: 2.0)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerRight,
                widthFactor: 1.5,
                child: widget.icons,
              ),
              Text(widget.text,
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
              const SizedBox(width: 30)
            ],
          ),
        ),
      ),
    );
  }
}
