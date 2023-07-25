import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.newsData}) : super(key: key);

  final Map<String, dynamic> newsData;

  @override
  Widget build(BuildContext context) {
    final String title = newsData['title'] ?? 'No Title';
    final String publishedTime = _getPublishedTime(newsData['publishedAt']);
    final String author = newsData['author'] ?? 'Unknown Author';
    final String description = newsData['description'] ?? 'No Description';
    final String imageUrl = newsData['urlToImage'] ?? '';

    return Scaffold(
      backgroundColor: Colors.black, // Background color of the screen
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Title color
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Published: $publishedTime',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey, // Published time color
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'By: $author',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // Author color
                ),
              ),
              const SizedBox(height: 40.0),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white, // Description color
                ),
              ),
              const SizedBox(height: 20.0),
              Image.network(
                imageUrl,
                height: 300, // Set the desired height for the image
                width: double.infinity, // Make the image take full width
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getPublishedTime(String? publishedAt) {
    if (publishedAt == null) return 'Unknown';

    final DateTime parsedTime = DateTime.parse(publishedAt);
    final Duration timeAgo = DateTime.now().difference(parsedTime);

    if (timeAgo.inDays > 0) {
      return '${timeAgo.inDays} ${timeAgo.inDays == 1 ? 'day' : 'days'} ago';
    } else if (timeAgo.inHours > 0) {
      return '${timeAgo.inHours} ${timeAgo.inHours == 1 ? 'hour' : 'hours'} ago';
    } else {
      return '${timeAgo.inMinutes} ${timeAgo.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    }
  }
}
