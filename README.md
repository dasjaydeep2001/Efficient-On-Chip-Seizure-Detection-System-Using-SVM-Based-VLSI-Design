# Efficient-On-Chip-Seizure-Detection-System-Using-SVM-Based-VLSI-Design
This on-chip system, designed for high efficiency and accuracy, is based on Very Large Scale Integration (VLSI) and employs a nonlinear Support Vector Machine (SVM). It comprises a feature extraction (FE) module that extracts relevant features from electroencephalogram (EEG) signals and an SVM module that efficiently learns and classifies seizures.
VLSI-Based Design: The system's hardware is based on Very Large Scale Integration (VLSI), which involves the integration of numerous electronic components onto a single chip. This approach allows for a compact and efficient design suitable for portable use.

##Nonlinear Support Vector Machine (SVM):
The core of the system is based on a nonlinear Support Vector Machine, which is a machine learning algorithm used for classification tasks. SVMs are known for their accuracy in binary classification, making them suitable for seizure detection.

##Feature Extraction (FE) Module: 
The system consists of a feature extraction module responsible for preprocessing the electroencephalogram (EEG) signals. It performs a three-level Daubechies discrete wavelet transform to analyze the physiological bands of the EEG signal. This step extracts time-frequency domain features that reflect the nonstationary signal properties. These features are critical for detecting seizures as they capture the signal's characteristics.

##SVM Module: 
The SVM module is responsible for the classification process. It uses the modified sequential minimal optimization algorithm along with a table-driven-based Gaussian kernel. The SVM is a machine learning model that is trained to classify EEG signals as either normal or indicative of a seizure. The efficient on-chip learning is crucial for making real-time decisions about detected seizures.
