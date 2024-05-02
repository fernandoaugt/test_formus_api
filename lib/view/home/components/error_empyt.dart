import 'package:flutter/material.dart';
import 'package:test_formus_api/helper/constants.dart';

class ErrorEmpyt extends StatelessWidget {
  const ErrorEmpyt({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Column(
            children: [
              Icon(
                Icons.error_outline_sharp,
                size: 75,
                color: Constants.fontColor,
              ),
              Text(
                "Erro ao carregar Filmes",
                style: TextStyle(color: Constants.fontColor),
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(
                    "Tentar novamente",
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
