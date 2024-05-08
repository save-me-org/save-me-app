import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:save_me_app/providers/people.dart';
import 'package:save_me_app/shared/presentation/base_screen.dart';

import '../../domain/people.dart';
import '../../utils/geolocation.dart';

class WhereScreen extends StatelessWidget {
  const WhereScreen({super.key});

  Future<Position> _getCurrentPositionOrThrowError(BuildContext context) async {
    return getCurrentLocation().catchError((e) {
      if (!context.mounted) throw e;
      Overlay.of(context).insert(OverlayEntry(
        builder: (context) => Tooltip(
            message: 'Fail to get your location: $e',
            showDuration: const Duration(seconds: 2)),
      ));
      throw e;
    });
  }

  _updateLocationByPosition(BuildContext context, PeopleProvider people) async {
    var position = await _getCurrentPositionOrThrowError(context);
    var placemark = await getPlacemarkByPosition(position);
    var address = formatPlacemarkAddress(placemark);
    var location = PeopleLocation(position, address);

    people.updateLocation(location);
  }

  _onPressLocationBtn(BuildContext context, PeopleProvider provider,
      TextEditingController addressController) async {
    await _updateLocationByPosition(context, provider);
    var address = provider.people.location!.address;
    addressController.text = address;
    print(provider.people.toJson());
  }

  @override
  Widget build(BuildContext context) {
    var peopleProvider = context.watch<PeopleProvider>();
    var addressController = TextEditingController();

    return BaseScreen(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(controller: addressController),
        ElevatedButton(
            child: const Text('Get location'),
            onPressed: () =>
                _onPressLocationBtn(context, peopleProvider, addressController))
      ],
    )));
  }
}
