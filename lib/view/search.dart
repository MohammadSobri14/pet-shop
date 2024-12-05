import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _activeCategory = 'Food';
  TextEditingController searchController = TextEditingController();
  List<String> searchHistory = []; // Menyimpan riwayat pencarian

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 24, top: 39, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x11000000),
                          blurRadius: 20,
                          offset: Offset(4, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 65),
                    child: Text(
                      "Search",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Container(
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFE5E4E3)),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Icon(
                      Icons.search,
                      color: Color(0xFFB3B1B0),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Search your Product',
                        hintStyle: TextStyle(
                          color: Color(0xFFB3B1B0),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                        border: InputBorder.none,
                      ),
                      onSubmitted: (value) {
                        // Menambahkan pencarian ke riwayat secara descending
                        setState(() {
                          if (value.isNotEmpty) {
                            searchHistory.insert(
                                0, value);
                          }
                        });
                        searchController
                            .clear();
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Container(
                width: 268,
                height: 47,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCategoryButton('Food'),
                    _buildCategoryButton('Accessories'),
                    _buildCategoryButton('Toys'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14, top: 32),
              child: Text(
                "Recent",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
            ),
            // Menampilkan riwayat pencarian
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: searchHistory.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      searchHistory[index],
                      style: TextStyle(
                        color:
                            Colors.grey,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.close,
                          color: Colors
                              .grey), 
                      onPressed: () {
                        setState(() {
                          searchHistory
                              .removeAt(index);
                        });
                      },
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

  // Kategori
  Widget _buildCategoryButton(String category) {
    final bool isActive = _activeCategory == category;
    return GestureDetector(
      onTap: () {
        setState(() {
          _activeCategory = category;
        });
      },
      child: Container(
        width: category == 'Accessories' ? 106 : 70,
        height: 47,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF7140FC) : const Color(0xFFF7F7F7),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFFD9D9D9),
            width: 1,
          ),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: const Color(0x3F000000),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [], // Tidak ada bayangan jika tidak aktif
        ),
        alignment: Alignment.center,
        child: Text(
          category,
          style: TextStyle(
            color: isActive ? Colors.white : const Color(0xFFB3B1B0),
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
