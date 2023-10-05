import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_trial/common/constants/app_constants.dart';
import 'package:work_trial/feature/country/domain/entities/country_entity.dart';
import 'package:work_trial/feature/country/presentation/bloc/country_details/country_details_bloc.dart';
import 'package:work_trial/feature/country/presentation/screen/country_details_screen.dart';
import 'package:work_trial/feature/country/presentation/widgets/failure_widget.dart';
import 'package:work_trial/feature/country/presentation/widgets/loader_widget.dart';

import '../../../../common/colors/app_colors.dart';
import '../bloc/country_list/country_list_bloc.dart';

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({super.key});

  @override
  State<CountryListScreen> createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<CountryListBloc, CountryListState>(
          builder: (context, state) {
            if (state.status.isInitial || state.status.isLoading) {
              return const LoaderWidget();
            } else if (state.status.isLoaded) {
              return _BuildLoadedWidget(state.countries);
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
  final List<CountryEntity> countries;

  const _BuildLoadedWidget(this.countries);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        // horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // * header text
          const _BuildHeaderText(),

          const SizedBox(
            height: 20,
          ),

          // * horizontal card country list with details
          Expanded(
            child: _BuildCardList(countries: countries),
          )
        ],
      ),
    );
  }
}

class _BuildCardList extends StatelessWidget {
  const _BuildCardList({
    required this.countries,
  });

  final List<CountryEntity> countries;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      padding: const EdgeInsets.only(
        left: 20,
      ),
      children: [
        for (var country in countries) ...[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _BuildFlagCard(country: country),
              const SizedBox(
                height: 20,
              ),
              _BuildCountryDetails(country: country),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ],
    );
  }
}

class _BuildCountryDetails extends StatelessWidget {
  const _BuildCountryDetails({
    required this.country,
  });

  final CountryEntity country;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          country.name,
          style: TextStyle(
            color: AppColors.fontPrimaryColor,
            fontSize: AppConstants.headerFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text(
              'Capital: ',
              style: TextStyle(
                color: AppColors.fontLabelColor,
                fontSize: AppConstants.labelFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              country.capital,
              style: TextStyle(
                color: AppColors.fontPrimaryLightColor,
                fontSize: AppConstants.labelFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Language: ',
              style: TextStyle(
                color: AppColors.fontLabelColor,
                fontSize: AppConstants.labelFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var language in country.languages)
                  Text(
                    language,
                    style: TextStyle(
                      color: AppColors.fontPrimaryLightColor,
                      fontSize: AppConstants.labelFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _BuildFlagCard extends StatelessWidget {
  const _BuildFlagCard({
    required this.country,
  });

  final CountryEntity country;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<CountryDetailsBloc>().add(
              GetCountryDetails(selectedCountry: country),
            );

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const CountryDetailsScreen()));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.cardRadius),
          color: AppColors.cardBackground,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 80,
            vertical: 30,
          ),
          child: Center(
            child: FadeIn(
              child: Text(
                country.emoji,
                style: const TextStyle(
                  fontSize: 80,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BuildHeaderText extends StatelessWidget {
  const _BuildHeaderText();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
      ),
      child: Text(
        'USD Countries',
        style: TextStyle(
          color: AppColors.fontPrimaryColor,
          fontSize: AppConstants.headerFontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
