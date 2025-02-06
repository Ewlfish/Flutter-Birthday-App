import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Home());
  }
}

class Home extends StatelessWidget {
  playSound() {
    final player = AudioCache();
    player.play('audio/take2.m4a');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Happy Birthday Grandpa!"),
      ),
      body: Container(
        margin: EdgeInsets.all(
          8,
        ),
        child: ListView(
          children: <Widget>[
            Container(
              height: 750,
              child: StoryView(
                [
                  StoryItem.text(
                    "Dear Grandpa,\n\n Happy Birthday!\n Thank you for taking us to all the amazing places in Taiwan.\nYou are extremely kind and helpful.\nWe hope you have a wonderful day.\nSee you in Taiwan!\n\nLove, Evelyn and Ethan",
                    Colors.purple,
                    fontSize: 40,
                    roundedTop: true,
                  ),
                  StoryItem.inlineImage(
                    AssetImage("images/story1.png"),
                    caption: Text(
                      "We spent 8 hours making this cake!",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  StoryItem.inlineImage(
                    AssetImage("images/story2.png"),
                    caption: Text(
                      "Hay Mom! Don't eat all the cake! Leave some for the reat of us!",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  )
                ],
                onStoryShow: (s) {
                  print("Showing a story");
                },
                onComplete: () {
                  print("Completed a cycle");
                },
                progressPosition: ProgressPosition.bottom,
                repeat: false,
                inline: true,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: playSound(),
        tooltip: 'Play Sound',
        child: Icon(Icons.add),
      ),
    );
  }
}

class MoreStories extends StatefulWidget {
  @override
  _MoreStoriesState createState() => _MoreStoriesState();
}

class _MoreStoriesState extends State<MoreStories> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("More"),
      ),
      body: StoryView(
        [
          StoryItem.text(
            "I guess you'd love to see more of our food. That's great.",
            Colors.blue,
          ),
          StoryItem.text(
            "Nice!\n\nTap to continue.",
            Colors.red,
          ),
          StoryItem.pageImage(
            NetworkImage(
                "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg"),
            caption: "Still sampling",
          ),
          StoryItem.pageGif(
              "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
              caption: "Working with gifs",
              controller: storyController),
          StoryItem.pageGif(
            "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
            caption: "Hello, from the other side",
            controller: storyController,
          ),
          StoryItem.pageGif(
            "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
            caption: "Hello, from the other side2",
            controller: storyController,
          ),
        ],
        onStoryShow: (s) {
          print("Showing a story");
        },
        onComplete: () {
          print("Completed a cycle");
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
        controller: storyController,
      ),
    );
  }
}
