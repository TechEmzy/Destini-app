import 'package:flutter/material.dart';
import 'package:destini_app/story_brain.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

// create a new storyBrain object from the StoryBrain class in the story_brain.dart file.
StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'), 
            fit: BoxFit.cover, 
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    // display the story title text from the story data list.
                    storyBrain.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                      // color: Colors.red,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      // Calling the nextStory() method from storyBrain and passing the number 1 as the choice made by the user.
                      storyBrain.nextStory(1);
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text(
                    // display the text for choice1 from the story data list.
                    storyBrain.getChoice1(),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white, // Ensure text is visible on the red background
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                // set the visible button if there's text(true) to display, but if there is not(false) it shouldn't display.
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                          // Calling the nextStory() method from storyBrain and passing the number 2 as the choice made by the user.
                          storyBrain.nextStory(2);
                        });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Set the background color
                    ),
                    child: Text(
                      // display the text for choice2 from the story data.
                      storyBrain.getChoice2(),
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white, // Ensure text is visible on the blue background
                      ),
                    ),
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
