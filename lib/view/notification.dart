import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  // Variabel untuk melacak tombol aktif (default adalah "Activity")
  bool isActivityActive = true;

  // Contoh data notifikasi
  final List<Map<String, String>> notifications = [
    {
      "title": "SALE 50%",
      "description": "Check the details on your favorite items!",
      "time": "2 hours ago",
      "image": "assets/images/produk1.png", // Tambahkan path gambar
    },
    {
      "title": "New Feature Update",
      "description":
          "We have introduced a seller dashboard for better tracking.",
      "time": "Yesterday",
      "image": '', // Tidak ada gambar
    },
    {
      "title": "Order Shipped",
      "description": "Your order #12345 has been shipped. Track it now!",
      "time": "3 days ago",
      "image": '', // Tidak ada gambar
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header dengan tombol kembali dan judul
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 46,
                    height: 46,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      shadows: [
                        BoxShadow(
                          color: const Color(0x11000000),
                          blurRadius: 20,
                          offset: const Offset(4, 4),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                const Text(
                  "Notification",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Switch antara "Activity" dan "Seller Mode"
            Center(
              child: Container(
                width: 240,
                height: 45,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF7F7F7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: Row(
                  children: [
                    // Tombol "Activity"
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isActivityActive = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isActivityActive
                                ? const Color(0xFF7140FC)
                                : const Color(0xFFF7F7F7),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Center(
                            child: Text(
                              'Activity',
                              style: TextStyle(
                                color: isActivityActive
                                    ? Colors.white
                                    : const Color(0xFFB3B1B0),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Tombol "Seller Mode"
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isActivityActive = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isActivityActive
                                ? const Color(0xFFF7F7F7)
                                : const Color(0xFF7140FC),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Center(
                            child: Text(
                              'Seller Mode',
                              style: TextStyle(
                                color: isActivityActive
                                    ? const Color(0xFFB3B1B0)
                                    : Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 0),
            // Daftar Notifikasi
            Expanded(
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return GestureDetector(
                    onTap: () {
                      // Aksi ketika notifikasi diklik
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(notification["title"]!),
                          content: Text(notification["description"]!),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Close"),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // Gambar produk untuk "SALE 50%" atau ikon lonceng untuk lainnya
                          if (notification["image"] != null &&
                              notification["image"]!.isNotEmpty)
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(notification["image"]!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          else
                            Container(
                              width: 48,
                              height: 48,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFD9D9D9),
                              ),
                              child: const Icon(
                                Icons.notifications, // Ikon lonceng
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          const SizedBox(width: 12),

                          // Detail Notifikasi
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  notification["title"]!,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  notification["description"]!,
                                  style: const TextStyle(
                                    color: Color(0xFFB3B1B0),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Waktu Notifikasi
                          Text(
                            notification["time"]!,
                            style: const TextStyle(
                              color: Color(0xFFB3B1B0),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
