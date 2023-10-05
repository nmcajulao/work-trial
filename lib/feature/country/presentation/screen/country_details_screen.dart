import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_trial/common/colors/app_colors.dart';

import '../../../../common/constants/app_constants.dart';
import '../bloc/country_details/country_details_bloc.dart';
import '../widgets/failure_widget.dart';
import '../widgets/loader_widget.dart';

class CountryDetailsScreen extends StatefulWidget {
  const CountryDetailsScreen({super.key});

  @override
  State<CountryDetailsScreen> createState() => _CountryDetailsScreenState();
}

class _CountryDetailsScreenState extends State<CountryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CountryDetailsBloc, CountryDetailsState>(
          builder: (context, state) {
            if (state.status.isInitial || state.status.isLoading) {
              return const LoaderWidget();
            } else if (state.status.isLoaded) {
              return _BuildLoadedWidget(state);
            } else {
              return const FailureWidget();
            }
          },
        ),
      ),
    );
  }
}

class _BuildLoadedWidget extends StatelessWidget {
  final CountryDetailsState state;

  const _BuildLoadedWidget(this.state);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // * App Bar
        const _BuildAppBar(),

        const SizedBox(
          height: 20,
        ),

        // * Circle Avatar
        _BuildCircleAvatar(state: state),

        const SizedBox(
          height: 20,
        ),

        // * Header Country Name
        _BuildHeaderCountryName(state: state),

        const SizedBox(
          height: 30,
        ),

        // * Divider
        const _BuildDivider(),

        const SizedBox(
          height: 30,
        ),

        // * Details
        _BuildDetails(state: state),
      ],
    );
  }
}

class _BuildDetails extends StatelessWidget {
  const _BuildDetails({
    required this.state,
  });

  final CountryDetailsState state;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                'Capital'.toUpperCase(),
                style: TextStyle(
                  color: AppColors.fontLabelColor,
                  fontSize: AppConstants.labelFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                state.selectedCountry!.capital,
                style: TextStyle(
                  color: AppColors.fontPrimaryLightColor,
                  fontSize: AppConstants.detailslabelFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                'Languages'.toUpperCase(),
                style: TextStyle(
                  color: AppColors.fontLabelColor,
                  fontSize: AppConstants.labelFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              for (var language in state.countryDetails!.languages) ...[
                Text(
                  language,
                  style: TextStyle(
                    color: AppColors.fontPrimaryLightColor,
                    fontSize: AppConstants.detailslabelFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ]
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                'Currency'.toUpperCase(),
                style: TextStyle(
                  color: AppColors.fontLabelColor,
                  fontSize: AppConstants.labelFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                state.selectedCountry!.capital,
                style: TextStyle(
                  color: AppColors.fontPrimaryLightColor,
                  fontSize: AppConstants.detailslabelFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BuildDivider extends StatelessWidget {
  const _BuildDivider();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 5,
      color: AppColors.cardBackground,
    );
  }
}

class _BuildHeaderCountryName extends StatelessWidget {
  const _BuildHeaderCountryName({
    required this.state,
  });

  final CountryDetailsState state;

  @override
  Widget build(BuildContext context) {
    return Text(
      state.selectedCountry!.name,
      style: TextStyle(
        color: AppColors.fontPrimaryColor,
        fontSize: AppConstants.detailsHeaderFontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _BuildCircleAvatar extends StatelessWidget {
  const _BuildCircleAvatar({
    required this.state,
  });

  final CountryDetailsState state;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.cardBackground,
      radius: 90,
      child: Text(
        state.selectedCountry?.emoji ?? '',
        style: const TextStyle(
          fontSize: 70,
        ),
      ),
    );
  }
}

class _BuildAppBar extends StatelessWidget {
  const _BuildAppBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
      ),
      child: InkWell(
        onTap: () => Navigator.of(context).pop(),
        child: Row(
          children: [
            const Icon(
              Icons.keyboard_backspace_rounded,
              size: 18,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'Back',
              style: TextStyle(
                color: AppColors.fontPrimaryColor,
                fontSize: AppConstants.headerFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
