import 'package:flutter/material.dart';

class CarouselViewExample extends StatelessWidget {
  const CarouselViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 240),
            child: CarouselView(
                itemExtent: MediaQuery.of(context).size.width - 40,
                itemSnapping: true,
                backgroundColor: Colors.white,
                children: List.generate(10, (index) {
                  return SizedBox(
                    child: Image.network(
                      // random images
                      'https://picsum.photos/400?random=$index',
                      fit: BoxFit.cover,
                    ),
                  );
                })),
          ),
          
        ],
      ),
    );
  }
}
