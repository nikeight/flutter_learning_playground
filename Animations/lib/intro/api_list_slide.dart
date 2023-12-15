import 'package:flutter/material.dart';

class ApiListSlide extends StatefulWidget {
  const ApiListSlide({super.key});

  @override
  State<ApiListSlide> createState() => _ApiListSlideState();
}

class _ApiListSlideState extends State<ApiListSlide> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        double minScrollExtent1 = _scrollController.position.minScrollExtent;
        double maxScrollExtent1 = _scrollController.position.maxScrollExtent;

        animateToMaxMin(
          maxScrollExtent1,
          minScrollExtent1,
          maxScrollExtent1,
          10,
          _scrollController,
        );
      },
    );
  }

  animateToMaxMin(double max, double min, double direction, int seconds,
      ScrollController scrollController) {
    scrollController
        .animateTo(direction,
            duration: Duration(seconds: seconds), curve: Curves.linear)
        .then((value) {
      direction = direction == max ? min : max;
      animateToMaxMin(max, min, direction, seconds, scrollController);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'API we will be learning',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      backgroundColor: Colors.yellow.shade200,
      body: Center(
        child: ApiListWidget(
          scrollController: _scrollController,
          apiList: apiList,
        ),
      ),
    );
  }
}

class ApiListWidget extends StatelessWidget {
  final ScrollController scrollController;
  final List<String> apiList;

  const ApiListWidget(
      {super.key, required this.scrollController, required this.apiList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: apiList.length,
      itemBuilder: (context, index) {
        final item = apiList[index];
        return Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Text(item),
          ),
        );
      },
    );
  }
}

List<String> apiList = [
  'Implicit Animations',
  'Explicit Animations',
  'Hero Animations',
  'Navigation Animations',
  'Text Animations',
  'AnimationWidget Animations',
  'AnimationBuilder Animations',
  'CustomPainter Animations',
  'CustomClipper Animations',
];
