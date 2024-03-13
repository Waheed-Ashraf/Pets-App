import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatefulWidget {
  final void Function(String searchedBreedsId) onTap;
  const CustomSearchTextField({super.key, required this.onTap});

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  final myController = TextEditingController();
  bool _folded = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      width: _folded ? 56 : MediaQuery.of(context).size.width * .8,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.white,
        boxShadow: kElevationToShadow[2],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 16),
              child: !_folded
                  ? TextField(
                      controller: myController,
                      onSubmitted: (value) {
                        widget.onTap(myController.text);

                        setState(() {
                          _folded = !_folded;
                        });
                      },
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                      decoration: InputDecoration(
                        hintText: 'search',
                        hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                        border: InputBorder.none,
                      ),
                    )
                  : null,
            ),
          ),
          Material(
            type: MaterialType.transparency,
            child: _folded
                ? InkWell(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Icon(
                        FontAwesomeIcons.magnifyingGlass,
                        color: Theme.of(context).colorScheme.primary,
                        size: 20,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _folded = !_folded;
                      });
                    },
                  )
                : InkWell(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(32),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(32),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Icon(
                        FontAwesomeIcons.anglesLeft,
                        color: Theme.of(context).colorScheme.primary,
                        size: 20,
                      ),
                    ),
                    onTap: () {
                      widget.onTap(myController.text);
                      setState(() {
                        _folded = !_folded;
                      });
                    },
                  ),
          )
        ],
      ),
    );
  }
}
