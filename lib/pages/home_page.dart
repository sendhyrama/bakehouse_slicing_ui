import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../common/colors.dart';
import '../common/text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor.c8,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: PrimaryColor.c8,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage('assets/images/rayumanis.png'),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Selamat Pagi!",
                        style: TextStyles.b1.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Rayu Manis",
                        style: TextStyles.h3.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_outlined,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Material(
                    elevation: 1,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    child: SvgPicture.asset(
                      'assets/images/chart1.svg',
                      height: 290,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    color: SecondaryColor.c8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/moneys.svg',
                                width: 40,
                                height: 40,
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total Pendapatan',
                                    style: TextStyles.b1.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Text(
                                    'Jan - Jun 24',
                                    style: TextStyles.b2,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Text('1.080.050', style: TextStyles.h2),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.arrow_upward,
                                  color: SuccessColor.c5,
                                  size: 24,
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Pendapatan',
                                      style: TextStyles.b1.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '2.000.000',
                                      style: TextStyles.h4.copyWith(
                                        color: SuccessColor.c5,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      'Jan - Jun 24',
                                      style: TextStyles.b2,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.arrow_downward,
                                  color: DangerColor.c5,
                                  size: 24,
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Pengeluaran',
                                      style: TextStyles.b1.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '1.000.050',
                                      style: TextStyles.h4.copyWith(
                                        color: DangerColor.c5,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      'Jan - Jun 24',
                                      style: TextStyles.b2,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Material(
                    elevation: 1,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    child: SvgPicture.asset(
                      'assets/images/order-dashboard.svg',
                      height: 265,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Material(
                    elevation: 1,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    child: SvgPicture.asset(
                      'assets/images/chart2.svg',
                      height: 230,
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
