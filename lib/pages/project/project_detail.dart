import 'package:flutter/material.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/responsive.dart';

class ProjectDetail extends StatelessWidget {
  final Project project;
  const ProjectDetail({required this.project, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BackButton(
                        onPressed: () => Navigator.pop(context),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        project.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          project.year.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 25),
                  Hero(
                    tag: project.name,
                    child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: 
                      Responsive(
                        mobile: Image.network(
                          project.imageUrl,
                          fit: BoxFit.cover,
                        ),
                        tablet: Image.network(
                          project.imageUrl,
                          fit: BoxFit.cover,
                        ),
                        desktop: SizedBox(
                          height: 350,
                          child: Image.network(
                            project.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Technologies",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  HorizontalTechView(
                    techList: project.technologiesUsed ?? []
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    project.description,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}

class HorizontalTechView extends StatelessWidget {
  final List<String> techList;
  const HorizontalTechView({required this.techList, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: techList.length,
        itemBuilder: (context, index) => Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(right: 15, left: 15),
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Text(
            techList[index],
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
