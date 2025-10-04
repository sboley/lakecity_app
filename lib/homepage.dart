import 'package:flutter/material.dart';
import 'package:lakecity_app/ice-cream-flavors.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  @override
   build(BuildContext context) async {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.yellow),
              child: Text('Lake City Creamery'),
            ),
            ListTile(title: const Text('Flavors'), onTap:
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FlavorScreen(
                  flavorsUrl:
                  "https://lakecity-creamery.com/flavors.txt",
                ),
              ),
            )
            ),

            //_launchFlavors),
            ListTile(title: const Text('Menu'), onTap: _launchMenu),
            ListTile(title: const Text('Location'), onTap: _launchMap),
            ListTile(title: const Text('Facebook'), onTap: _launchShare),
            ListTile(title: const Text('Call'), onTap: _launchCall),
          ],
        ),
      ),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Lake City Creamery & Coffee',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.pink[100],
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(5),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'images/LCC copy.png',
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                              25.0,
                              10.0,
                              0.0,
                              0.0,
                            ),
                            child: Text(
                              ('Lake City Creamery & Coffee'),
                              style: TextStyle(
                                color: Colors.purple.shade800,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                              25.0,
                              0.0,
                              0.0,
                              0.0,
                            ),
                            child: Text(
                              ('Celina, OH'),
                              style: TextStyle(
                                color: Colors.purple.shade800,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                fontStyle: FontStyle.italic,
                              ),
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  FavoriteWidget(),
                ],
              ),
              Center(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        10.0,
                        10.0,
                        0.0,
                        8.0,
                      ),
                      child: Text(
                        'The best homemade ice cream anywhere! ',
                        // 'and unique flavors '
                        // 'in our hometown of Celina, Ohio. '
                        // 'We take immense pride in '
                        // 'the creation of each batch by hand and serving unique flavors to our '
                        // 'customers. Our ice cream is made daily so you can be sure that you are '
                        // 'getting the freshest and highest quality ice cream anywhere.',

                        style: TextStyle(
                          color: Colors.purple.shade800,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          fontStyle: FontStyle.italic,
                        ),
                        softWrap: true,
                        // 'available anywhere. Our sweet cream base is made with a perfect high '
                        // 'quality 14% butterfat which insures the perfect balance of creaminess'
                        // 'and sweetness. Our busiest times are evenings and weekends so you will'
                        // 'often find a line formed by our loyal customers. We are here to serve you'
                        // 'and put a smile on your face mid-March through mid-December each year.',
                      ),
                    ),
                  ),
                ),
              ),
              // Add from here
              //below is Authentication Sign In functionality.  Removing for now due to expenses that it would cost to keep it in.
              // Consumer<ApplicationState>(
              //   builder: (context, appState, _) => Authentication(
              //     email: appState.email,
              //     loginState: appState.loginState,
              //     startLoginFlow: appState.startLoginFlow,
              //     verifyEmail: appState.verifyEmail,
              //     signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
              //     cancelRegistration: appState.cancelRegistration,
              //     registerAccount: appState.registerAccount,
              //     signOut: appState.signOut,
              //   ),
              // ),
              // // to here
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(Icons.icecream),
                            iconSize: 30.0,
                            color: Colors.deepPurpleAccent,
                            onPressed: _launchFlavors,
                          ),
                          Text(
                            'FLAVORS',
                            style: TextStyle(
                              color: Colors.deepPurpleAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.restaurant_menu),
                            iconSize: 30.0,
                            color: Colors.pink[300],
                            onPressed: _launchMenu,
                          ),
                          Text(
                            'MENU',
                            style: TextStyle(
                              color: Colors.pink[300],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.share),
                            iconSize: 30.0,
                            color: Colors.blueAccent,
                            onPressed: _launchShare,
                          ),
                          Text(
                            'FACEBOOK',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.near_me),
                            iconSize: 30.0,
                            color: Colors.green,
                            onPressed: _launchMap,
                          ),
                          Text(
                            'INFO',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      // Column(
                      //   children: [
                      //     IconButton(
                      //       icon: Icon(Icons.add_call),
                      //       iconSize: 30.0,
                      //       color: Colors.yellow[800],
                      //       onPressed: _launchCall,
                      //     ),
                      //     Text(
                      //       'CALL',
                      //       style: TextStyle(
                      //         color: Colors.yellow[800],
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



_launchFlavors() async {
  const url = 'https://store-x36sk.mybigcommerce.com/ice-cream-flavors/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

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

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 5469;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                padding: EdgeInsets.all(2),
                alignment: Alignment.centerRight,
                icon: (_isFavorited
                    ? Icon(Icons.star)
                    : Icon(Icons.star_border)),
                color: Colors.red.shade500,
                onPressed: _toggleFavorite,
              ),
              SizedBox(
                width: 50,
                child: Container(child: Text('$_favoriteCount')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
