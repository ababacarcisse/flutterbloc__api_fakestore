import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  final int quantity;
  final void Function(int newQuantity)
      onQuantityChanged; // Nouvelle propriété ajoutée

  const QuantitySelector(
      {Key? key, required this.quantity, required this.onQuantityChanged})
      : super(key: key);

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              if (widget.quantity > 0) {
                widget.onQuantityChanged(widget.quantity -
                    1); // Appel de la fonction onQuantityChanged
              }
            });
          },
          child: const CircleAvatar(
            radius: 22,
            backgroundColor: Color.fromARGB(255, 138, 59, 59),
            child: Icon(Icons.remove),
          ),
        ),
        Text(
          "${widget.quantity}", // Utilisation de la propriété `quantity` du widget parent
          style: const TextStyle(fontSize: 20),
        ),
        InkWell(
          onTap: () {
            setState(() {
              widget.onQuantityChanged(widget.quantity +
                  1); // Appel de la fonction onQuantityChanged
            });
          },
          child: const CircleAvatar(
            radius: 22,
            backgroundColor: Color.fromARGB(255, 138, 59, 59),
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
