# منصة Fikrah

منصة Fikrah هي بيئة رقمية متكاملة تهدف إلى تمكين المستخدمين من تحويل أفكارهم إلى مشاريع واقعية، باستخدام أدوات مفتوحة المصدر وتجربة مرنة على الأجهزة المحمولة.

## ⚙️ المميزات

- واجهة React حديثة
- خادم Express مدمج
- دعم للوظائف السحابية (Netlify Functions)
- إعداد تلقائي عبر Termux أو بيئة Bash
- دعم اللغة العربية بالكامل

## 🚀 بدء التشغيل

```bash
pkg update && pkg upgrade
pkg install git -y
git clone https://github.com/maarefa-hub/fikrah-plat.git
cd fikrah-plat/client
npm install
npm run build
