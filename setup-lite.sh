#!/data/data/com.termux/files/usr/bin/bash

echo "🚀 بدء إنشاء منصة Fikrah المتكاملة..."

# بيانات الهوية
GITHUB_USER="maarefa-hub"
GITHUB_EMAIL="k774468815k@gmail.com"

# إنشاء مجلد المشروع
mkdir fikrah-plat && cd fikrah-plat

# إعداد Git
git init
git config user.name "$GITHUB_USER"
git config user.email "$GITHUB_EMAIL"

# إنشاء مجلدات المنصة
mkdir -p client/public client/src/{pages,components}
mkdir -p server/{routes,ai}
mkdir shared scripts

# ملفات أساسية
touch README.md .env .gitignore

# واجهة React أولية
echo 'import React from "react"; import ReactDOM from "react-dom/client"; import App from "./App"; const root = ReactDOM.createRoot(document.getElementById("root")); root.render(<App />);' > client/src/index.js

echo 'export default function App() { return <h1>منصة Fikrah جاهزة</h1>; }' > client/src/App.js

# صفحة دردشة بسيطة
echo 'export default function Chat() { return <div>دردشة Fikrah</div>; }' > client/src/pages/Chat.js

# خادم Express أولي
echo 'import express from "express"; const app = express(); app.use(express.json()); app.post("/ai/chat", (req, res) => { res.send({ reply: "رد من Fikrah AI" }); }); app.listen(3001, () => console.log("✅ Fikrah Server Ready"));' > server/index.js

# أول Commit
git add .
git commit -m "📦 منصة Fikrah جاهزة للتشغيل"

# ضغط المشروع
cd ..
zip -r fikrah-plat.zip fikrah-plat -x "**/node_modules/**" "**/.git/**"

echo "✅ تم تجهيز المنصة بالكامل. جاهزة للانطلاق 🎉"
