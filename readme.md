## OCRTraining_HALCON
Example for OCR training within AppSpace using the HALCON API.
### Description
This App shows how to train an OCR handle based on a given training image and
label file which contains the identified characters of the training image.
The labels are sorted line wise (from left to right and from top to bottom).
The output of this sample is a trained OCR handle file in public AppData which
then can be used in the OCRReading_HALCON sample.

### How to Run
The results can be seen in the 2D viewer on the web-page. Restarting the Sample may
be necessary to show images after loading the web-page.
To run this Sample a device with SICK Algorithm API, HALCON support and
AppEngine >= V2.5.0 is required. E.g. SIM4000 with latest firmware.

### Implementation
This sample is written using HALCON 12

### Topics
Algorithm, HALCON, OCR, Sample, SICK-AppSpace