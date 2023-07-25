import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package
import 'package:newsflow/services/firebase_auth_methods.dart';
import 'package:provider/provider.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:newsflow/services/news_service.dart';
import 'package:newsflow/screens/login_screen.dart';

import '../pallete.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> newsData = [];

  @override
  void initState() {
    super.initState();
    fetchNewsData();
  }

  Future<void> fetchNewsData() async {
    final NewsService newsService = NewsService();
    final data = await newsService.fetchNewsData();
    setState(() {
      newsData = data;
    });
  }

  List<dynamic> get newsWithImages {
    return newsData.where((news) => news['urlToImage'] != null).toList();
  }

  @override
  Widget build(BuildContext context) {
    var isLoading = newsData.isEmpty;
    var screenHeight = MediaQuery.of(context).size.height;
    var cardHeight = screenHeight * 0.8;
    return (isLoading)
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.black,
              title: Image.asset(
                'assets/images/news-192.png',
                fit: BoxFit.contain,
                height: 48,
              ),
              actions: [
                IconButton(
                  onPressed: () => _logout(context),
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),
            body: Center(
              child: AppinioSwiper(
                cardsCount: newsWithImages.length,
                cardsBuilder: (context, index) {
                  final news = newsWithImages[index];
                  return Card(
                    color: Pallete.greyColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: SizedBox(
                      height: cardHeight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            // Image section with 60% of card height
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                news['urlToImage'],
                                fit: BoxFit.cover,
                                height: cardHeight * 0.6,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              news['title'] ?? 'No Title',
                              style: const TextStyle(
                                color: Pallete.whiteColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              news['description'] ?? 'No Description',
                              style: const TextStyle(
                                color: Pallete.lightGreyColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              _getPublishedTime(news['publishedAt']),
                              style: const TextStyle(
                                color: Pallete.lightGreyColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0), // Add extra space here
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
  }

  String _getPublishedTime(String publishedAt) {
    if (publishedAt == null) return 'Unknown';
    final DateTime parsedTime = DateTime.parse(publishedAt);
    final Duration timeAgo = DateTime.now().difference(parsedTime);
    final String formattedTime = timeAgo.inHours >= 1
        ? '${timeAgo.inHours} hours ago'
        : '${timeAgo.inMinutes} minutes ago';
    return 'Published $formattedTime';
  }

  void _logout(BuildContext context) {
    final FirebaseAuthMethods authMethods =
        Provider.of<FirebaseAuthMethods>(context, listen: false);
    authMethods.signOut(context);

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
      (route) => false,
    );
  }
}
