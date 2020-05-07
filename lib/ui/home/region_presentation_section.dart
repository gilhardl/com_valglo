import 'package:flutter/material.dart';

import 'package:comvalglo/providers/media_query_provider.dart';

import 'package:comvalglo/ui/text.dart';

class RegionPresentationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MQ.contentMaxWidth(context),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SectionTitle('Notre région'),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 64.0),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: VideoPlayer(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MQ.md(context) ? 640 : 1280,
      height: MQ.md(context) ? 360 : 720,
      child: HtmlElementView(viewType: 'youtube_iframe'),
    );
  }
}
