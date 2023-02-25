import 'package:flutter/material.dart';
import 'package:my_apps/constant.dart';

class DaftarButton extends StatelessWidget {
  final Function()? onTap;
  const DaftarButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: kuning,
            fixedSize: const Size(345, 55),
            side: BorderSide(color: hitam, width: 3),
            textStyle: TextStyle(
              fontSize: 24,
              color: hitam,
              fontWeight: FontWeight.w900,
            ),
            shape: const StadiumBorder()),
        child: Text(
          'Daftar',
          style: TextStyle(color: hitam),
        ),
      ),
    );
  }
}
