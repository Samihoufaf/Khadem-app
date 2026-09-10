import 'package:flutter/material.dart';

void main() => runApp(const KhademApp());

class KhademApp extends StatelessWidget {
  const KhademApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khadem',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'sans',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF087F5B)),
        scaffoldBackgroundColor: const Color(0xFFF7F8F7),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 900), () {
      if (mounted) Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (_) => const OnboardingScreen()));
    });
  }
  @override
  Widget build(BuildContext context) => const Scaffold(
    body: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
      Icon(Icons.handyman_rounded, size: 64, color: Color(0xFF087F5B)),
      SizedBox(height: 12),
      Text('Khadem', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800)),
      SizedBox(height: 6),
      Text('الخدمة اللي تحتاجها، تلقاها.')
    ])),
  );
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const Spacer(),
        const Icon(Icons.search_rounded, size: 92, color: Color(0xFF087F5B)),
        const SizedBox(height: 30),
        const Text('الخدمة اللي تحتاجها، تلقاها.', textAlign: TextAlign.center,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800)),
        const SizedBox(height: 12),
        const Text('احكيلنا واش تحتاج، والذكاء الاصطناعي يساعدك تلقى الخدام المناسب والقريب منك.',
          textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.black54)),
        const Spacer(),
        FilledButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RoleScreen())),
          child: const Padding(padding: EdgeInsets.all(14), child: Text('ابدأ الآن')),
        ),
      ]),
    )),
  );
}

class RoleScreen extends StatelessWidget {
  const RoleScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('اختار نوع الحساب')),
    body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        RoleCard(icon: Icons.person_search_rounded, title: 'نحتاج خدمة',
          subtitle: 'نلقى خدام يصلحلي مشكلتي',
          onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()))),
        const SizedBox(height: 14),
        RoleCard(icon: Icons.handyman_rounded, title: 'أنا خدام',
          subtitle: 'نقدم خدمات للناس',
          onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const WorkerHomeScreen()))),
      ]),
    ),
  );
}

class RoleCard extends StatelessWidget {
  final IconData icon; final String title, subtitle; final VoidCallback onTap;
  const RoleCard({super.key, required this.icon, required this.title, required this.subtitle, required this.onTap});
  @override
  Widget build(BuildContext context) => Card(
    child: InkWell(onTap: onTap, borderRadius: BorderRadius.circular(16),
      child: Padding(padding: const EdgeInsets.all(20), child: Row(children: [
        CircleAvatar(radius: 28, child: Icon(icon)),
        const SizedBox(width: 16),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4), Text(subtitle, style: const TextStyle(color: Colors.black54))
        ])),
        const Icon(Icons.arrow_forward_ios_rounded, size: 18)
      ]))),
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  final pages = const [HomeBody(), OrdersScreen(), MessagesScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) => Scaffold(
    body: pages[index],
    bottomNavigationBar: NavigationBar(
      selectedIndex: index,
      onDestinationSelected: (i) => setState(() => index = i),
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'الرئيسية'),
        NavigationDestination(icon: Icon(Icons.receipt_long_outlined), selectedIcon: Icon(Icons.receipt_long), label: 'طلباتي'),
        NavigationDestination(icon: Icon(Icons.chat_bubble_outline), selectedIcon: Icon(Icons.chat_bubble), label: 'الرسائل'),
        NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'حسابي'),
      ],
    ),
  );
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});
  @override
  Widget build(BuildContext context) => SafeArea(child: ListView(
    padding: const EdgeInsets.fromLTRB(18, 18, 18, 24),
    children: [
      const Text('سلام 👋', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
      const SizedBox(height: 4),
      const Row(children: [Icon(Icons.location_on, size: 18), SizedBox(width: 4), Text('Biskra')]),
      const SizedBox(height: 20),
      Card(child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AISearchScreen())),
        borderRadius: BorderRadius.circular(18),
        child: const Padding(padding: EdgeInsets.all(20), child: Row(children: [
          CircleAvatar(radius: 25, child: Icon(Icons.auto_awesome)),
          SizedBox(width: 14),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('واش تحتاج؟', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            SizedBox(height: 4), Text('احكيلنا على المشكل بطريقتك...', style: TextStyle(color: Colors.black54))
          ])),
          Icon(Icons.arrow_forward_ios_rounded, size: 18)
        ]))),
      const SizedBox(height: 24),
      const Text('الخدمات الشائعة', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
      const SizedBox(height: 12),
      Wrap(spacing: 10, runSpacing: 10, children: const [
        ServiceChip('🔧 Plombier'), ServiceChip('⚡ Électricien'), ServiceChip('🎨 Peintre'),
        ServiceChip('🧱 Maçon'), ServiceChip('🧹 Nettoyage'), ServiceChip('🚗 Mécanicien'),
      ]),
      const SizedBox(height: 26),
      const Text('خدامين قريبين منك', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
      const SizedBox(height: 12),
      WorkerCard(name: 'Mohamed B.', job: 'Plombier', distance: '0.8 km', rating: '4.9'),
      WorkerCard(name: 'Ahmed K.', job: 'Électricien', distance: '1.4 km', rating: '4.8'),
    ],
  ));
}

class ServiceChip extends StatelessWidget {
  final String text; const ServiceChip(this.text, {super.key});
  @override Widget build(BuildContext context) => Chip(label: Text(text), padding: const EdgeInsets.all(8));
}

class WorkerCard extends StatelessWidget {
  final String name, job, distance, rating;
  const WorkerCard({super.key, required this.name, required this.job, required this.distance, required this.rating});
  @override
  Widget build(BuildContext context) => Card(child: ListTile(
    leading: const CircleAvatar(child: Icon(Icons.person)),
    title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
    subtitle: Text('$job  •  📍 $distance'),
    trailing: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('⭐ $rating'), const Text('متوفر', style: TextStyle(fontSize: 12))
    ]),
    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const WorkerProfileScreen())),
  ));
}

class AISearchScreen extends StatefulWidget {
  const AISearchScreen({super.key});
  @override State<AISearchScreen> createState() => _AISearchScreenState();
}
class _AISearchScreenState extends State<AISearchScreen> {
  final controller = TextEditingController();
  bool analyzed = false;
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('المساعد الذكي 🤖')),
    body: Padding(padding: const EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      const Text('احكيلنا على المشكل', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
      const SizedBox(height: 8),
      const Text('تقدر تكتب بالدارجة، العربية أو الفرنسية.'),
      const SizedBox(height: 18),
      TextField(controller: controller, maxLines: 5,
        decoration: const InputDecoration(hintText: 'مثلاً: الروبيني راه يقطر والماء يخرج من تحت...',
          border: OutlineInputBorder(), prefixIcon: Icon(Icons.edit_note))),
      const SizedBox(height: 12),
      OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.camera_alt_outlined), label: const Text('أضف صورة')),
      const SizedBox(height: 12),
      FilledButton.icon(onPressed: () => setState(() => analyzed = true),
        icon: const Icon(Icons.auto_awesome), label: const Text('حلل المشكل')),
      if (analyzed) ...[
        const SizedBox(height: 22),
        Card(child: Padding(padding: const EdgeInsets.all(18), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('تحليل مبدئي', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const Text('يبدو أنك تحتاج إلى Plombier 🔧'),
          const SizedBox(height: 6),
          Text(controller.text.isEmpty ? 'تسرب ماء من الصنبور' : 'تم فهم طلبك: ${controller.text}'),
          const SizedBox(height: 14),
          FilledButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SearchWorkersScreen())),
            child: const Text('ابحث عن خدام')),
        ])))
      ]
    ])),
  );
}

class SearchWorkersScreen extends StatelessWidget {
  const SearchWorkersScreen({super.key});
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('الخدامين المناسبين')),
    body: ListView(padding: const EdgeInsets.all(16), children: [
      const Card(child: Padding(padding: EdgeInsets.all(16), child: Row(children: [
        Icon(Icons.auto_awesome), SizedBox(width: 10),
        Expanded(child: Text('رتبنا النتائج حسب التخصص، التقييم، المسافة والتوفر.'))
      ]))),
      WorkerCard(name: 'Mohamed B.', job: 'Plombier • أفضل تطابق', distance: '0.8 km', rating: '4.9'),
      WorkerCard(name: 'Karim A.', job: 'Plombier', distance: '2.1 km', rating: '4.7'),
      WorkerCard(name: 'Yacine M.', job: 'Plombier', distance: '3.4 km', rating: '4.6'),
    ]),
  );
}

class WorkerProfileScreen extends StatelessWidget {
  const WorkerProfileScreen({super.key});
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('ملف الخدام')),
    body: ListView(padding: const EdgeInsets.all(20), children: [
      const CircleAvatar(radius: 46, child: Icon(Icons.person, size: 48)),
      const SizedBox(height: 12),
      const Text('Mohamed B.', textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
      const Text('Plombier • ⭐ 4.9 (126 تقييم)', textAlign: TextAlign.center),
      const SizedBox(height: 22),
      const Text('الخدمات', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      const Text('• إصلاح التسربات\n• تركيب الحنفيات\n• سخانات الماء\n• صيانة plomberie'),
      const SizedBox(height: 18),
      const Text('الخبرة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      const Text('7 سنوات'),
      const SizedBox(height: 18),
      const Text('المناطق', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      const Text('Biskra وما حولها'),
      const SizedBox(height: 26),
      FilledButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RequestConfirmationScreen())),
        child: const Padding(padding: EdgeInsets.all(13), child: Text('طلب الخدمة'))),
    ]),
  );
}

class RequestConfirmationScreen extends StatelessWidget {
  const RequestConfirmationScreen({super.key});
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('تأكيد الطلب')),
    body: Padding(padding: const EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      const Card(child: Padding(padding: EdgeInsets.all(18), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Plomberie', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 8), Text('Mohamed B. • ⭐ 4.9'),
        SizedBox(height: 8), Text('📍 Biskra • 🕐 الآن'),
        SizedBox(height: 8), Text('السعر: يتم الاتفاق عليه مع الخدام')
      ]))),
      const Spacer(),
      FilledButton(onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const OrderStatusScreen())),
        child: const Padding(padding: EdgeInsets.all(13), child: Text('إرسال الطلب'))),
    ])),
  );
}

class OrderStatusScreen extends StatelessWidget {
  const OrderStatusScreen({super.key});
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('حالة الطلب')),
    body: Padding(padding: const EdgeInsets.all(20), child: Column(children: [
      const SizedBox(height: 30),
      const Icon(Icons.hourglass_top_rounded, size: 70),
      const SizedBox(height: 20),
      const Text('نستناو رد الخدام ⏳', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
      const SizedBox(height: 8),
      const Text('تم إرسال طلبك إلى Mohamed B.'),
      const Spacer(),
      OutlinedButton(onPressed: () => Navigator.pop(context), child: const Text('إلغاء الطلب')),
    ])),
  );
}

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});
  @override Widget build(BuildContext context) => const SimplePage(title: 'طلباتي', icon: Icons.receipt_long, text: 'مازال ما عندكش طلبات مكتملة في النسخة التجريبية.');
}
class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});
  @override Widget build(BuildContext context) => const SimplePage(title: 'الرسائل', icon: Icons.chat_bubble, text: 'المحادثات تظهر هنا بعد قبول طلب الخدمة.');
}
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override Widget build(BuildContext context) => const SimplePage(title: 'حسابي', icon: Icons.person, text: 'Sami\nBiskra\n\nالمعلومات الشخصية\nالعناوين\nالمفضلة\nالإشعارات\nالخصوصية');
}

class SimplePage extends StatelessWidget {
  final String title, text; final IconData icon;
  const SimplePage({super.key, required this.title, required this.icon, required this.text});
  @override Widget build(BuildContext context) => SafeArea(child: Padding(
    padding: const EdgeInsets.all(24),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Icon(icon, size: 42), const SizedBox(height: 14),
      Text(title, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w800)),
      const SizedBox(height: 20), Text(text, style: const TextStyle(fontSize: 16, height: 1.6))
    ]),
  ));
}

class WorkerHomeScreen extends StatelessWidget {
  const WorkerHomeScreen({super.key});
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Khadem • الخدام')),
    body: ListView(padding: const EdgeInsets.all(18), children: [
      const Text('سلام Mohamed 👋', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
      const SizedBox(height: 12),
      Card(child: SwitchListTile(value: true, onChanged: (_) {}, title: const Text('متوفر لاستقبال الطلبات'), subtitle: const Text('سيصلك إشعار بالطلبات القريبة'))),
      const SizedBox(height: 18),
      const Text('طلبات قريبة', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      Card(child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.plumbing)),
        title: const Text('طلب Plomberie'),
        subtitle: const Text('تسرب ماء • 1.2 km • الآن'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const WorkerRequestScreen())),
      )),
      const SizedBox(height: 18),
      const Text('اليوم', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      const ListTile(title: Text('طلبات مكتملة'), trailing: Text('3')),
      const ListTile(title: Text('الأرباح'), trailing: Text('4,500 دج')),
    ]),
  );
}

class WorkerRequestScreen extends StatelessWidget {
  const WorkerRequestScreen({super.key});
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('طلب جديد')),
    body: Padding(padding: const EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      const Card(child: Padding(padding: EdgeInsets.all(18), child: Text('🔧 Plomberie\n\nالمشكل: تسرب ماء من الصنبور\n\n📍 1.2 km\n⏰ الآن\n\nالميزانية المقترحة: 2000–3000 دج',
        style: TextStyle(fontSize: 16, height: 1.6)))),
      const Spacer(),
      Row(children: [
        Expanded(child: OutlinedButton(onPressed: () => Navigator.pop(context), child: const Text('رفض'))),
        const SizedBox(width: 12),
        Expanded(child: FilledButton(onPressed: () => Navigator.pop(context), child: const Text('قبول'))),
      ])
    ])),
  );
}
