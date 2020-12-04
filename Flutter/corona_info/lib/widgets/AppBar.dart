

AppBar(
  leading: Icon(Icons.arrow_back_sharp),
  title: Text('Page title'),
  actions: [
    Icon(Icons.favorite),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Icon(Icons.search),
    ),
    Icon(Icons.more_vert),
  ],
  backgroundColor: Colors.purple,
),