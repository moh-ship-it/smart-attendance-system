# 🚀 Smart Attendance System (IoT)

A comprehensive Full-stack solution for automated attendance management.

---

## 📖 Overview
هذا المشروع يقدم نظاماً متكاملاً لإدارة الحضور باستخدام تقنيات إنترنت الأشياء. يتم قراءة البيانات عبر **RFID** وإرسالها بواسطة **ESP32** إلى قاعدة بيانات **MySQL** عبر **PHP API**، ويتم عرض وإدارة البيانات من خلال تطبيق **Flutter**.

## 🏗 System Architecture
يوضح المخطط التالي كيفية تدفق البيانات بين العتاد (Hardware) والسحاب (Cloud) والتطبيق:



## 📁 Project Structure
- **/mobile_app**: The Flutter application source code.
- **/backend_api**: PHP scripts and REST API logic.
- **/firmware_esp32**: Arduino/C++ code for the ESP32 microcontroller.
- **/database**: Database schema and SQL exports.

## 🛠 Tech Stack
* **Mobile:** Flutter & Dart
* **Backend:** PHP & MySQL
* **Hardware:** ESP32, RFID RC522
* **Protocol:** HTTP / JSON

## 🚀 How it Works
1. **Scan:** User scans their RFID tag.
2. **Process:** ESP32 reads the UID and sends an HTTP POST request to the API.
3. **Store:** PHP API validates the data and saves it in MySQL.
4. **View:** Flutter app fetches and displays the attendance records in real-time.
