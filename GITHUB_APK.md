# بناء APK من الهاتف فقط

1. أنشئ Repository جديد على GitHub.
2. ارفع كامل ملفات هذا المشروع إلى الـRepository.
3. افتح تبويب **Actions**.
4. اختر **Build Khadem APK**.
5. اضغط **Run workflow**.
6. انتظر حتى تصبح العملية خضراء.
7. افتح نتيجة الـworkflow ثم قسم **Artifacts**.
8. حمّل `khadem-release-apk`.
9. فك الضغط عن الملف لتحصل على `app-release.apk`.

الـworkflow يبني نسخة Release باستخدام Flutter على GitHub Actions، ولا يحتاج Android Studio على هاتفك أو حاسوبك.
