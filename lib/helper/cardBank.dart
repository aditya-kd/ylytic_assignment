//normal card
import "package:flutter/material.dart";

Widget buildImageInteractionCard(context) {
  return Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Column(
      children: [
        Stack(
          children: [
            Ink.image(
              image: const AssetImage('images/lake.jpg'),
              height: 240,
              fit: BoxFit.cover,
            ),
            const Positioned(
              bottom: 16,
              right: 16,
              left: 16,
              child: Text(
                'Travel the world!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16).copyWith(bottom: 0),
          child: const Text(
            'The cat is the only domesticated species in the family Felidae and is often referred to as the domestic cat to distinguish it from the wild members of the family.',
            style: TextStyle(fontSize: 15),
          ),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.indigo),
              child: const Text('Buy Item'),
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content:  Text('Item Purchased')));
              },
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content:  Text('Item added to cart')));
                }),
          ],
        )
      ],
    ),
  );
}
