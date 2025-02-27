import 'package:go_router/go_router.dart';
import 'package:goals_app/models/purpose_entity.dart';
import 'package:goals_app/presentation/screens/index.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomeScreen()),
    GoRoute(
      path: '/details',
      builder: (context, state) {
        final PurposeEntity purposeEntity = state.extra as PurposeEntity;
        return DetailsScreen(purposeEntity: purposeEntity);
      },
    ),
    GoRoute(
      path: '/form',
      builder: (context, state) {
        final PurposeEntity? purposeEntity =
            state.extra != null ? state.extra as PurposeEntity : null;
        return FormsScreen(purposeEntity: purposeEntity);
      },
    ),
  ],
);
