import 'package:flutter/material.dart';

class ExchangeWidget extends StatefulWidget {
  final String header;
  final String footer;
  const ExchangeWidget({super.key, required this.header, required this.footer});

  @override
  State<ExchangeWidget> createState() => _ExchangeWidgetState();
}

class _ExchangeWidgetState extends State<ExchangeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.header),
        Row(
          children: [
            const Expanded(
              child: TextField()
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
              ),
              onPressed: () {},
              icon: const Icon(Icons.flag_outlined),
              label: const Text(
                'RUR',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Text(widget.footer),
      ],
    );
  }
}