import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Halo Chen Chen!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "NIM: 2201234567",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

            const SizedBox(height: 12),

            // Gambar destinasi utama
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
  "assets/images/labuan_bajo.png",
  height: 180,
  width: double.infinity,
  fit: BoxFit.cover,
),
            ),

            const SizedBox(height: 16),

            // Kolom Pencarian
            TextField(
              decoration: InputDecoration(
                hintText: "Cari destinasi, hotel, atau aktivitas...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Tombol Booking
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBookingButton(Icons.hotel, "Hotel"),
                _buildBookingButton(Icons.flight, "Pesawat"),
                _buildBookingButton(Icons.directions_bus, "Bus"),
                _buildBookingButton(Icons.train, "Train"),
                _buildBookingButton(Icons.hiking, "Kegiatan"),
              ],
            ),

            const SizedBox(height: 24),

            const Text(
              "Ulasan Destinasi Populer",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            // List destinasi populer
            _buildReviewCard(
  imageUrl: "assets/images/bali.png",
  title: "Pantai Bali",
  rating: 4.8,
  review: "Pantai terkenal dengan sunset yang indah",
),
           _buildReviewCard(
  imageUrl: "assets/images/bromo.png",
  title: "Gunung Bromo",
  rating: 4.7,
  review: "Tempat terbaik melihat sunrise",
),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue.shade100,
          ),
          child: Icon(icon, size: 28, color: Colors.blue),
        ),
        const SizedBox(height: 6),
        Text(label),
      ],
    );
  }

  Widget _buildReviewCard({
    required String imageUrl,
    required String title,
    required double rating,
    required String review,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: child: Image.asset(
  imageUrl,
  width: 100,
  height: 100,
  fit: BoxFit.cover,
),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      Text(" $rating"),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(review, maxLines: 2, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
