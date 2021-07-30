import 'package:flutter/material.dart';
import 'package:polls/polls.dart';

class Poll extends StatefulWidget {
  const Poll({Key? key}) : super(key: key);

  @override
  _PollState createState() => _PollState();
}

class _PollState extends State<Poll> {
  double option1 = 1.0;
  double option2 = 0.0;

  String user = "saurabkharel";
  Map usersWhoVoted = {'user1': 3, 'user2': 4, 'user3': 1, 'user4': 1};
  String creator = "eddy@mail.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Poll")),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Polls(
          children: [
            // This cannot be less than 2, else will throw an exception
            Polls.options(title: 'Yes', value: option1),
            Polls.options(title: 'No', value: option2),
          ],
          question: Text('Do you think the weather displayed is accurate?'),
          currentUser: this.user,
          creatorID: this.creator,
          voteData: usersWhoVoted,
          userChoice: usersWhoVoted[this.user],
          onVoteBackgroundColor: Colors.blue,
          leadingBackgroundColor: Colors.blue,
          backgroundColor: Colors.white,
          onVote: (choice) {
            print(choice);
            setState(() {
              this.usersWhoVoted[this.user] = choice;
            });
            if (choice == 1) {
              setState(() {
                option1 += 1.0;
              });
            }
            if (choice == 2) {
              setState(() {
                option2 += 1.0;
              });
            }
          },
        ),
      ),
    );
  }
}
