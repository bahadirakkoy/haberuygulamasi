import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/domain/rss_feed.dart';

class Haberler extends StatefulWidget {
  const Haberler({
    Key? key,
  }) : super(key: key);

  @override
  State<Haberler> createState() => _HaberlerState();
}

class _HaberlerState extends State<Haberler> {
  @override
  void initState() {
    super.initState();
  }

  Future<RssFeed> haberleriIndir() async {
    var response = await http.get(
        Uri.parse('https://www.mynet.com/yerel-haberler/rss/kategori/ana'));
    return RssFeed.parse(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RssFeed>(
      future: haberleriIndir(), // async work
      builder: (BuildContext context, AsyncSnapshot<RssFeed> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          default:
            if (snapshot.hasError) {
              return Center(child: Text('Hata: ${snapshot.error}'));
            } else {
              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: snapshot.data!.items?.length,
                itemBuilder: (BuildContext context, int index) {
                  var title = snapshot.data!.items?[index].title;
                  var description = snapshot.data!.items?[index].description;
                  var link = snapshot.data!.items?[index].link;

                  return Card(
                    elevation: 4,
                    child: ListTile(
                      onTap: () async {
                        await launchUrl(Uri.parse(link!));
                      },
                      title: Text(
                        title ?? 'Yüklenemdi',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        maxLines: 1,
                      ),
                      leading: const CircleAvatar(
                        radius: 25.0,
                        backgroundImage: NetworkImage(
                            'https://imgrosetta.mynet.com/file/1585522/300x300.jpg'),
                        backgroundColor: Colors.transparent,
                      ),
                      subtitle: Container(
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          description ?? 'Yüklenemdi',
                          style: const TextStyle(fontSize: 15),
                          maxLines: 2,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey[600],
                      ),
                    ),
                  );
                },
              );
            }
        }
      },
    );
  }
}
