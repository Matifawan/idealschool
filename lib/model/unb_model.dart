class UnboardingContent {
  String image; // Store the path as a string
  String title;
  String description;

  UnboardingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<UnboardingContent> contents = [
  UnboardingContent(
    title: ' IdealSchool System',
    image: 'assets/images/spl.png',
    description: 'Welcome to School Home,',
  ),
  UnboardingContent(
    title: 'Studdy Overview',
    image: 'assets/images/b.png',
    description: 'Explore covering KG-1 to 5.',
  ),
  UnboardingContent(
    title: 'AnyTime,AnyWhere',
    image: 'assets/images/c.png',
    description: 'Access education ',
  ),
];
