import 'package:flutter/material.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Search",
                filled: true,
                fillColor: Color.fromARGB(192, 192, 192, 192),
                prefixIcon: Icon(Icons.search, color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: stories.length,
                      itemBuilder: (context, index) {
                        return storyItem(stories[index]);
                      },
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: chats.length,
                    itemBuilder: (context, index) {
                      return chatItem(chats[index]);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget storyItem(Map<String, dynamic> story) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Stack(
            children: [
              story["name"] == "Your Story"
                  ? CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey.shade300,
                child: Icon(Icons.add, size: 30, color: Colors.black),
              )
                  : CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(story["image"]),
              ),
              if (story["name"] != "Your Story")
                Positioned(
                  bottom: 3,
                  right: 3,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor: story["active"] ? Colors.green : Colors.grey,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 5),
          Text(story["name"], style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget chatItem(Map<String, dynamic> chat) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(chat["image"]),
          ),
          Positioned(
            bottom: 3,
            right: 3,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 6,
                backgroundColor: chat["active"] ? Colors.green : Colors.grey,
              ),
            ),
          ),
        ],
      ),
      title: Text(chat["name"], style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(chat["message"]),
      trailing: Text(chat["time"]),
    );
  }
}

List<Map<String, dynamic>> stories = [
  {"name": "Your Story", "image": "", "active": false}, // سيتم استبدالها بالدائرة +
  {"name": "Ahmed", "image": "assets/images/ahmed.jpeg", "active": true},
  {"name": "Ali", "image": "assets/images/ali.jpeg", "active": false},
  {"name": "Rosy", "image": "assets/images/rosy.jpeg", "active": true},
  {"name": "shaden", "image": "assets/images/shaden.jpeg", "active": false},
  {"name": "lily", "image": "assets/images/lily.jpeg", "active": true},
  {"name": "Tamer", "image": "assets/images/Tamer.jpg", "active": false},
  {"name": "Adam", "image": "assets/images/adam.jpg", "active": true},
  {"name": "Berry", "image": "assets/images/berry.webp", "active": false},
];

List<Map<String, dynamic>> chats = [
  {"name": "Ahmed", "message": "Lets meet tomorrow", "time": "3:09 PM", "image": "assets/images/ahmed.jpeg", "active": true},
  {"name": "ali", "message": "Hey What's up?", "time": "Wed", "image": "assets/images/ali.jpeg", "active": false},
  {"name": "Rosy", "message": "Are you ready for the party...", "time": "Thu", "image": "assets/images/rosy.jpeg", "active": true},
  {"name": "shaden", "message": "Let's go have some fun", "time": "Wed", "image": "assets/images/shaden.jpeg", "active": false},
  {"name": "lily", "message": "Meeting at 5 PM", "time": "Mon", "image": "assets/images/lily.jpeg", "active": true},
  {"name": "Tamer", "message": "Check this out!", "time": "Sun", "image": "assets/images/Tamer.jpg", "active": false},
  {"name": "Adam", "message": "Call me when free", "time": "Sat", "image": "assets/images/adam.jpg", "active": true},
  {"name": "Berry", "message": "Lunch tomorrow?", "time": "Fri", "image": "assets/images/berry.webp", "active": false},
  {"name": "omar", "message": "Where are you?", "time": "Thu", "image": "assets/images/omar.jpeg", "active": true},
];
