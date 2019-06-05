import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_provider_example/models/stories.dart';

import 'package:state_provider_example/state/theme_state.dart';
import 'package:state_provider_example/state/app_state.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(Root());

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeState>.value(
          notifier: ThemeState(),
        ),
        ChangeNotifierProvider<AppState>.value(
          notifier: AppState(),
        )
      ],
      child: MyApp(),
    );
  }
}

//https://hn.algolia.com/assets/logo-hn-search.png

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeState>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData.getTheme(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Hacker News App"),
        leading: Provider.of<AppState>(context).isLoading
            ? Container(
                padding: EdgeInsets.all(10),
                child: CircularProgressIndicator(
                  backgroundColor: themeData.getTheme().canvasColor,
                ),
              )
            : Container(
                padding: EdgeInsets.all(10),
                child: Image.network(
                  "https://hn.algolia.com/assets/logo-hn-search.png",
                ),
              ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: StorySearch(),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.color_lens),
            onPressed: () {
              themeData.setTheme();
            },
          )
        ],
      ),
      body: Consumer<AppState>(
        builder: (context, state, _) => ListView(
              children:
                  state.stories.map((story) => _buildTile(story)).toList(),
            ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: Provider.of<AppState>(context).bottomIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.new_releases),
            title: Text("New Stories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Top Stories"),
          ),
        ],
        onTap: (index) {
          Provider.of<AppState>(context).changeStoryType(index);
        },
      ),
    );
  }

  Widget _buildTile(Stories story) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ExpansionTile(
        title: Text("${story.title}"),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("${story.descendants ?? 0} comments"),
              IconButton(
                icon: Icon(Icons.launch),
                onPressed: () async {
                  if (await canLaunch(story.url)) {
                    launch(story.url);
                  }
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

class StorySearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return query.isNotEmpty
        ? [
            IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                query = "";
              },
            )
          ]
        : [Container()];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Stories> _storyList = Provider.of<AppState>(context)
        .allStories
        .where((story) => story.title.toLowerCase().contains(query))
        .toList();

    if (_storyList.isEmpty) return Center(child: Text("No Results"));
    return ListView(
        children: _storyList
            .map(
              (story) => ListTile(
                    title: Text("${story.title}"),
                    onTap: () async {
                      if (await canLaunch(story.url)) {
                        launch(story.url);
                      }
                    },
                  ),
            )
            .toList());
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Stories> _storyList = Provider.of<AppState>(context)
        .allStories
        .where((story) => story.title.toLowerCase().contains(query))
        .toList();

    if (_storyList.isEmpty) return Center(child: Text("No Results"));
    return ListView(
        children: _storyList
            .map(
              (story) => ListTile(
                    title: Text("${story.title}"),
                    onTap: () async {
                      if (await canLaunch(story.url)) {
                        launch(story.url);
                      }
                    },
                  ),
            )
            .toList());
  }
}
