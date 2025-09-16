import 'package:flutter/material.dart';

class ShoppingItemCards extends StatefulWidget {
  const ShoppingItemCards({super.key});

  @override
  State<ShoppingItemCards> createState() => _ShoppingItemCardsState();
}

class _ShoppingItemCardsState extends State<ShoppingItemCards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Shopping Item Card',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              buildCard(
                url:
                'https://tse2.mm.bing.net/th/id/OIP.ks_9WSJKG8xaR0ww_ud4YAHaHa?pid=ImgDet&rs=1',
                title: 'Samsung Galaxy S25',
                subtitle: 'Latest flagship smartphone',
                count: 2,
              ),
              buildCard(
                url:
                'data:image/jpeg;base64,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',
                title: 'motorola edge 60 fusion',
                subtitle: 'Latest Phone',
                count: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card buildCard({
    required String url,
    required String title,
    String subtitle = '...',
    int count = 0,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: 180,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                url,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text(subtitle),
                    const SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                backgroundColor: Colors.grey.shade300,
                                minimumSize: const Size(40, 40),
                              ),
                              onPressed: () {},
                              child: const Text('-'),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 6),
                              child: Text(
                                '$count',
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                backgroundColor: Colors.grey.shade300,
                                minimumSize: const Size(40, 40),
                              ),
                              onPressed: () {},
                              child: const Text('+'),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
