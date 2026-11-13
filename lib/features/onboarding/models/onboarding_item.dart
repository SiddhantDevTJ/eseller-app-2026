enum OnboardingType {
  reachBuyers,
  turnOpportunities,
  decisionMakers,
}

class OnboardingItem {
  final int id;
  final String title;
  final String description;
  final OnboardingType type;

  const OnboardingItem({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
  });

  static const List<OnboardingItem> items = [
    OnboardingItem(
      id: 1,
      title: 'Reach 50,000+ software\nbuyers every month',
      description:
          'Showcase your software on Techjockey and get discovered by thousands of buyers actively looking for solutions.',
      type: OnboardingType.reachBuyers,
    ),
    OnboardingItem(
      id: 2,
      title: 'Turn every opportunity\ninto a conversation',
      description:
          'Stay on top of new leads, calls and demo requests. Connect with potential buyers anytime, anywhere.',
      type: OnboardingType.turnOpportunities,
    ),
    OnboardingItem(
      id: 3,
      title: 'Connect with the people\nwho make decisions',
      description:
          'Discover key decision-makers, access buyer insights and reach the right people through email or LinkedIn.',
      type: OnboardingType.decisionMakers,
    ),
  ];
}

