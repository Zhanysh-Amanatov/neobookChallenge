import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/info.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Эко Маркет',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Text(
                          'Фрукты, овощи, зелень, сухофрукты а так же сделанные из натуральных ЭКО продуктов (варенье, салаты, соления, компоты и т.д.) можете заказать удобно, качественно и по доступной цене. Готовы сотрудничать взаимовыгодно с магазинами. Наши цены как на рынке. Мы заинтересованы в экономии ваших денег и времени. Стоимость доставки 150 сом и ещё добавлен для окраину города. При отказе подтвержденного заказа более 2-х раз Клиент заносится в чёрный список!!',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        SizedBox(height: 30.h),
                        ElevatedButton.icon(
                          icon: const FaIcon(
                            FontAwesomeIcons.phone,
                            size: 24,
                          ),
                          onPressed: () {},
                          label: const Text('Позвонить'),
                        ),
                        SizedBox(height: 30.h),
                        ElevatedButton.icon(
                          icon: const FaIcon(
                            FontAwesomeIcons.whatsapp,
                            size: 24,
                          ),
                          onPressed: () {},
                          label: const Text('WhatsApp'),
                        ),
                        SizedBox(height: 30.h),
                        ElevatedButton.icon(
                          icon: const FaIcon(
                            FontAwesomeIcons.instagram,
                            size: 24,
                          ),
                          onPressed: () {},
                          label: const Text('Instagram'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 50.h,
            left: 160.w,
            child:
                Text('Инфо', style: Theme.of(context).textTheme.headlineMedium),
          ),
        ],
      ),
    );
  }
}
