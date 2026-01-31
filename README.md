# 🚨 Silent SOS

Silent SOS is an accessibility-first emergency assistance app designed for situations where a person cannot speak. With a single tap, the app generates an emergency alert that includes the user’s critical medical information and real-time location to enable faster and more informed help.

---

## 🧩 Problem Statement
In emergency situations such as medical distress, panic attacks, abuse, accidents, or unconsciousness, a person may be unable to speak or explain their condition. Existing emergency solutions often rely on voice calls or typing, which are not always possible.

---

## ✅ Solution
Silent SOS provides a **silent, one-tap emergency system** that:
- Works without voice interaction
- Automatically attaches critical information
- Is accessible even from the lock screen
- Prioritizes clarity, speed, and inclusivity

---

## 📱 Key Features
- 🏥 One-tap emergency categories (Medical, Police, etc.)
- 🩺 Stored medical profile (name, blood group, conditions, allergies)
- 🤖 AI-enhanced SOS messages using **Google Gemini**
- 📍 Auto-attached **Google Maps live location**
- 🔒 Lock-screen emergency access UI
- ♿ Accessibility-first dark, high-contrast design

---

## 🛠️ Tech Stack
- **Flutter** – Cross-platform app development
- **Google Maps** – Real-time location sharing
- **Google Gemini AI** – Intelligent emergency message enhancement
- **SharedPreferences** – Local medical data storage

---

## 🧠 How Gemini AI Is Used
Google Gemini is used to:
- Enhance SOS messages for **clarity and urgency**
- Structure emergency text in a responder-friendly format
- Reduce ambiguity during critical situations

> ⚠️ For demo reliability, Gemini responses are currently simulated.  
> The architecture is **fully API-ready** for real Gemini API integration.

---

## 👥 Team

- Agnes Mary G 
- Sharmili S
- Musthafa Habibulla Athika
- Suchitra Balaganesh  


**Hackathon:** Flutter Sprint

**Conducted by:**  Google Developer Community (GDC) 

---

## 🚀 How to Run the Project

```bash
git clone https://github.com/XO-Agnes/silent-sos.git
cd silent-sos
flutter pub get
flutter run
