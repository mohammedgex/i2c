ضع هنا أيقونة التطبيق الرئيسية باسم `app_icon.png`.

المتطلبات الموصى بها:
- صيغة: PNG
- مقاس موصى به: 1024x1024 (مناسب لكل المنصات)
- اسم الملف: `app_icon.png`

خطوات توليد أيقونات الـ launcher بعد وضع الصورة:
1. افتح PowerShell في مجلد المشروع (المجلد الذي يحتوي `pubspec.yaml`).
2. شغّل:
   flutter pub get
3. ثم شغّل مولد الأيقونات:
   flutter pub run flutter_launcher_icons:main

ملاحظات بديلة (يدوي):
- Android: ضع صور للـ launcher في `android/app/src/main/res/mipmap-*/` واستبدل `ic_launcher.png` و`ic_launcher_foreground.png` إذا كانت موجودة.
- iOS: استبدل الصور في `ios/Runner/Assets.xcassets/AppIcon.appiconset/` باستخدام Xcode أو عبر ملفات JSON المطلوبة.

إذا أردت، أقدر أشرح الخطوات اليدوية بالتفصيل أو أساعد في إضافة أي ملفات أيقونة جاهزة.