import 'package:assessment1/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextFieldWithLabel extends StatelessWidget {
  final String hintText;

  const TextFieldWithLabel({Key? key, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: screenWidth * 0.85,
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
            ),
          ),
        ),
      ],
    );
  }
}

class TextFieldWithLabel1 extends StatelessWidget {
  const TextFieldWithLabel1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.85,
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Consumer<HomeProvider>(
              builder: (context, businessTypeProvider, _) => Text(
                'Business Type: ${businessTypeProvider.selectedValue}',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          Container(
            child: PopupMenuButton<String>(
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'Retail',
                    child: Text('Retail'),
                  ),
                  PopupMenuItem<String>(
                    value: 'Wholesale',
                    child: Text('Wholesale'),
                  ),
                ];
              },
              onSelected: (String value) {
                Provider.of<HomeProvider>(context, listen: false)
                    .setSelectedValue(value);
                print('Selected: $value');
              },
              icon: Icon(Icons.arrow_drop_down),
            ),
          ),
        ],
      ),
    );
  }
}
