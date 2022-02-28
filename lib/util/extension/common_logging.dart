import 'package:logger/logger.dart';

extension CommonLogging on Logger {
  void logEvent<T>() {
    log(Level.debug, "Event fired: ${T}");
  }

  void logEventForCubit({required String eventName}) {
    log(Level.debug, "Event: ${eventName} fired in cubit: ${runtimeType}");
  }

  void logBlocEventSubscriptionAdded({required Type subscriberType}) {
    log(
      Level.debug,
      "${subscriberType.toString()} Subscribed for: ${runtimeType}",
    );
  }

  void logBlocEventSubscriptionRemoved({required Type subscriberType}) {
    log(
      Level.debug,
      "${subscriberType} Unsubscribed for: ${runtimeType}",
    );
  }

  void logEventNotification(
      {required Type subscriberType, required Type notificationType}) {
    log(
      Level.debug,
      "${runtimeType.toString()} is notifying: ${subscriberType.toString()} of notification: ${notificationType.toString()}",
    );
  }

  void logReceivedEventNotification({required Type notificationType}) {
    log(
      Level.debug,
      "${runtimeType.toString()} received notification: ${notificationType.toString()}",
    );
  }
}
