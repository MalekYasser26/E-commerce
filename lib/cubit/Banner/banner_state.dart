part of 'banner_cubit.dart';

@immutable
abstract class BannerState {}

class BannerInitial extends BannerState {}
class BannerSuccessState extends BannerState {}
class BannerFailureState extends BannerState {}
class BannerLoadingState extends BannerState {}


