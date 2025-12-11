# Digital Image Processing Project – MATLAB

## 📌 Overview
This project is part of the **Digital Image Processing** course.  
Each team member implements one processing function in MATLAB, and all functions are integrated into a single GUI.

---

## 👥 Team Members & Tasks

### 🔹 Abd-elrahman Kamel Bakr — Canny Edge Detection
- Function: `canny_edge.m`
- Description: Applies Canny Edge Detection to extract image edges.

### 🔹 Mostafa Ali AboHadid — Difference of Gaussian (DoG)
- Function: `dog_filter.m`
- Description: Applies Difference of Gaussian to detect soft edges and blobs.

### 🔹 Abdallah Ebrahim Abdallah— Add Salt & Pepper Noise
- Function: `add_sp_noise.m`
- Description: Adds Salt & Pepper noise with a customizable noise ratio.

### 🔹 Khaled Ahmed Haggag — Add Gaussian Noise
- Function: `add_gaussian_noise.m`
- Description: Adds Gaussian noise based on a given variance.

### 🔹 Ahmed Osama El-Raghy — Noise Removal
- Function: `remove_noise.m`
- Description: Removes noise using median or Gaussian filtering.

### 🔹 Zeyad Mohamed El-Daly — Histogram Equalization
- Function: `hist_eq.m`
- Description: Enhances image contrast using histogram equalization.

### 🔹 Omar Ali Abd-Elrady & Mohamed El-Saeed Abo-elkhir — GUI Development
- `main_gui.m` → Main window and layout  
- `gui_logic.m` → Button callbacks and linking all functions  

---

## 📁 Project Structure

## 📂 هيكلة المشروع (Project Structure)



```text
Project_Root/
│
├── Functions/                  
│   ├── add_gaussian_noise.m    
│   ├── add_sp_noise.m          
│   ├── canny_edge.m            
│   ├── dog_filter.m            
│   ├── hist_eq.m              
│   └── remove_noise.m          
│
├── gui/                        
│   ├── gui_logic.m            
│   └── main_gui.m              
│
└── README.md                   

---

## ▶️ How to Run

1. Open **MATLAB**
2. Add the project folder to the MATLAB Path  
3. Go to the `GUI` folder  
4. Run the main file:
5. Upload an image  
6. Use the buttons to apply processing functions  

---

## 🛠 Requirements
- MATLAB R2020a or newer  
- Image Processing Toolbox  

---

## 📎 Notes
- Every function must accept an input image and return a processed image.  
- GUI is responsible for displaying the original and processed images.  
- All members work on separate branches before merging into `main`.  

---


