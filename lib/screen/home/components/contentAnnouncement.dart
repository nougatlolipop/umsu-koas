import 'package:flutter/material.dart';

class ContentAnnouncement extends StatelessWidget {
  const ContentAnnouncement({
    Key key,
    this.title,
    this.announcement,
  }) : super(key: key);
  final String title, announcement;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Flexible(
            child: Text(
              announcement,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
