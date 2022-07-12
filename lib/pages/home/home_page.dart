import 'package:flutter/material.dart';
import 'package:my_portfolio/examples/projects.dart';
import 'package:my_portfolio/widgets/cards/project_card.dart';
import 'package:my_portfolio/responsive.dart';
import 'package:my_portfolio/widgets/header.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (() => Share.share(
          "Check out Laurens's portfolio https://my-portfolio-40814.web.app/#/"
        )),
        child: const Icon(
          Icons.share,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: SizedBox(
            width: screenSize.width,
            height: screenSize.height,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Header(),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Projects",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Responsive(
                      mobile: mobileTabletBuilder(350),
                      tablet: mobileTabletBuilder(450),
                      desktop: desktopbuilder(),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Widget mobileTabletBuilder(double height) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return ProjectCard(project: projects[index]);
        },
      ),
    );
  }

  Widget desktopbuilder() {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,  
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return ProjectCard(project: projects[index]);
      },
    );
  }
}
