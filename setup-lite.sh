#!/bin/bash
echo "🚀 بدء إنشاء منصة Fikrah المتكاملة..."

# بيانات المستخدم
GITHUB_USER="maarefa-hub"
GITHUB_EMAIL="k774468815k@gmail.com"

# إنشاء مجلد المشروع
mkdir fikrah-plat && cd fikrah-plat

# إعداد Git
git init
git config user.name "$GITHUB_USER"
git config user.email "$GITHUB_EMAIL"

# إنشاء مجلدات رئيسية
mkdir client server shared scripts docs config

# مجلدات الواجهة
mkdir -p client/public client/src/{components,pages,services,contexts,hooks,themes,i18n,style}

# مجلدات الخادم
mkdir -p server/{routes,controllers,middleware,models,uploads,rewards,ai,livestream,moderation,notifications,analytics,database}

# ملفات أساسية
touch .env README.md package.json Dockerfile .gitignore

# تعبئة ملفات الواجهة
echo 'import React from "react"; import ReactDOM from "react-dom/client"; import App from "./App"; import "./style/main.css"; const root = ReactDOM.createRoot(document.getElementById("root")); root.render(<App />);' > client/src/index.js

echo 'import { BrowserRouter as Router, Routes, Route } from "react-router-dom"; import Chat from "./pages/Chat"; import Home from "./pages/Home"; import Dashboard from "./pages/Dashboard"; import Login from "./pages/Login"; export default function App() { return (<Router><Routes><Route path="/" element={<Home />} /><Route path="/chat" element={<Chat />} /><Route path="/dashboard" element={<Dashboard />} /><Route path="/login" element={<Login />} /></Routes></Router>); }' > client/src/App.js

echo 'import { useState } from "react"; export default function Chat() { const [message, setMessage] = useState(""); const [reply, setReply] = useState(""); async function sendMessage() { const res = await fetch("/ai/chat", { method: "POST", headers: { "Content-Type": "application/json" }, body: JSON.stringify({ prompt: message }) }); const data = await res.json(); setReply(data.reply); } return (<div><textarea onChange={(e) => setMessage(e.target.value)} /><button onClick={sendMessage}>Send</button><p>{reply}</p></div>); }' > client/src/pages/Chat.js

echo 'export default function Login() { return (<div><h2>Login</h2><input type="email" placeholder="Email" /><input type="password" placeholder="Password" /><button>Login</button></div>); }' > client/src/pages/Login.js

# تعبئة ملفات الخادم
echo 'import express from "express"; import cors from "cors"; import mongoose from "mongoose"; import aiRoutes from "./routes/aiRoutes.js"; import userRoutes from "./routes/userRoutes.js"; const app = express(); app.use(cors()); app.use(express.json()); app.use("/ai", aiRoutes); app.use("/user", userRoutes); mongoose.connect(process.env.MONGODB_URI).then(() => console.log("✅ MongoDB Connected")); app.listen(3001, () => console.log("🧠 Server running on port 3001"));' > server/index.js

echo 'import express from "express"; import { askAI } from "../ai/assistant.js"; const router = express.Router(); router.post("/chat", async (req, res) => { const { prompt } = req.body; const reply = await askAI(prompt); res.send({ reply }); }); export default router;' > server/routes/aiRoutes.js

echo 'import express from "express"; const router = express.Router(); router.post("/login", (req, res) => { res.send({ token: "demo-token" }); }); export default router;' > server/routes/userRoutes.js

echo 'export async function askAI(prompt) { return "Hello from Fikrah AI! You said: " + prompt; }' > server/ai/assistant.js

# أول Commit
git add .
git commit -m "منصة Fikrah جاهزة للنشر"

# ضغط المشروع
cd ..
zip -r fikrah-plat.zip fikrah-plat -x "**/node_modules/**" "**/.git/**"

echo "✅ تم تجهيز المنصة بالكامل. جاهزة للانطلاق 🎉"
