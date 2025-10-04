import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class FlavorService {
  final String flavorsUrl;

  FlavorService(this.flavorsUrl);

  Future<List<String>> getFlavors() async {
    final response = await http.get(Uri.parse(flavorsUrl));
    if (response.statusCode == 200) {
      final lines = response.body
          .split('\n')
          .map((line) => line.trim())
          .where((line) => line.isNotEmpty)
          .toList();
      return lines;
    } else {
      throw Exception("Failed to load flavors");
    }
  }

  Future<String> getDailyFlavor(List<String> flavors) async {
    final today = DateTime.now();
    final seed = int.parse("${today.year}${today.month}${today.day}");
    final random = Random(seed);
    return flavors[random.nextInt(flavors.length)];
  }
}



class FlavorScreen extends StatefulWidget {
  final String flavorsUrl;

  const FlavorScreen({Key? key, required this.flavorsUrl}) : super(key: key);

  @override
  _FlavorScreenState createState() => _FlavorScreenState();
}


class _FlavorScreenState extends State<FlavorScreen> {
  late Future<Map<String, dynamic>> _flavorData;

  @override
  void initState() {
    super.initState();
    final service = FlavorService(widget.flavorsUrl);

    _flavorData = service.getFlavors().then((flavors) async {
      final daily = await service.getDailyFlavor(flavors);
      return {"flavors": flavors, "daily": daily};
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("🍦 Ice Cream Flavors")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.yellow),
              child: Text('Lake City Creamery'),
            ),
            ListTile(
              title: const Text('Flavors'),
              onTap: () async {
               await Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context) => const FlavorScreen(
                     flavorsUrl:
                     "https://lakecity-creamery.com/flavors.txt",
                   ),
                 ),
               );
              },
            ),
            ListTile(title: const Text('Menu'), onTap: _launchMenu),
            ListTile(title: const Text('Location'), onTap: _launchMap),
            ListTile(title: const Text('Facebook'), onTap: _launchShare),
            ListTile(title: const Text('Call'), onTap: _launchCall),
          ],
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _flavorData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            final flavors = snapshot.data!["flavors"] as List<String>;
            final daily = snapshot.data!["daily"] as String;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    color: Colors.pink[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          const Icon(Icons.star, color: Colors.pink, size: 28),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "Today's Flavor: $daily",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "All Available Flavors:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.separated(
                      itemCount: flavors.length,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (context, index) {
                        final flavor = flavors[index];
                        return ListTile(
                          leading: const Icon(Icons.icecream, color: Colors.brown),
                          title: Text(flavor),
                          trailing: flavor == daily
                              ? const Icon(Icons.check_circle, color: Colors.pink)
                              : null,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}


// _launchFlavors() async {
//   _launchFlavors() {
//     MaterialPageRoute(
//         builder: (context) => const IceCreamFlavors(
//           flavorsUrl: "https://lakecity-creamery.com/ice-cream-flavors",
//         ));
//   }
// }

_launchMenu() async {
  const url = 'https://store-x36sk.mybigcommerce.com/menu/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchShare() async {
  const url = 'https://www.facebook.com/LakeCityCreamery/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchMap() async {
  const url =
      'https://www.google.com/search?q=lake+city+creamery&oq=lake+city+creamery&aqs=chrome..69i57j46i175i199i512j69i60l2j69i61.2831j0j15&sourceid=chrome&ie=UTF-8#';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchCall() async {
  const url =
      'https://www.google.com/search?q=lake+city+creamery&sxsrf=AOaemvJdaIKrzfItfX1cVeVh8dGAGR8AUw%3A1633444533277&source=hp&ei=tWJcYcKjDv6XwbkP1fqlwAc&iflsig=ALs-wAMAAAAAYVxwxWdUThkQP7BguGtKdc03NlqYxoXV&gs_ssp=eJzj4tFP1zc0ysg2KzYzLjZgtFI1qLCwME41SbSwNDQ2NTBJM0yxMqgwtTAwTkxKMTYzSTVONUg18hLKScxOVUjOLKlUSC5KTcxNLaoEANl1FVk&oq=lake+city+creamery&gs_lcp=Cgdnd3Mtd2l6EAEYADINCC4QxwEQrwEQJxCTAjIFCC4QgAQyCAguEIAEELEDMggILhCABBCxAzIFCAAQgAQyBQguEIAEMhEILhCABBCxAxCDARDHARCjAjIICC4QgAQQsQMyCAguEIAEELEDMgUIABCABDoECCMQJzoFCAAQkQI6DgguEIAEELEDEMcBEKMCOg4ILhCABBCxAxDHARDRAzoICAAQgAQQsQM6CwguEIAEEMcBEK8BOgsILhCABBCxAxCDAToICC4QsQMQgwE6CgguEMcBEK8BECc6BQguEJECOggIABCABBDJA1CQDVjRGWCGKmgAcAB4AIABe4gBpwaSAQMwLjeYAQCgAQE&sclient=gws-wiz';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
