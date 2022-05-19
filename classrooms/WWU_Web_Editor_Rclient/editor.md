# openEO Platform Editor

## Introduction

openEO Platform is a EO data processing platform built on top of [openEO](https://openeo.org).
In openEO and openEO Platform, data processing is centered around data cubes.
It is recommended to read the **[data cube guide](https://openeo.org/documentation/1.0/datacubes.html)** before starting to work with openEO Platform to better understand the basic concepts.

The *openEO Platform Editor* (also called *Web Editor*) is a browser-based graphical user interface for openEO Platform.
It allows to use the openEO Platform services without any coding experience.
You can explore the service offerings such as data collections and processes, but also create and run custom processes on our infrastructure and then visualize the results.
Result visualization is still a bit limited, but all other features of the Platform are supported.

The Editor is available at **<https://editor.openeo.cloud>** and loads up in "Discovery mode" by default, which means you can explore the service offerings without being logged in.
On the left side you can find the service offerings like data collections and processes and on the right side the process editor is shown.

To enable more functionality, e.g. to compute something in a batch job, you have to login.
Hover over the button with the text "Guest" in the top right corner and it will show you a "Login" button.
Once you clicked on it, the login screen shows up. Here you can simply click the "Log in with EGI Check-in" button and the login procedure will start.
Please note that you need to be [registered before to get access to openEO Platform](https://openeo.cloud/#plans). 
**For ESA LPS we will provide credentials for test accounts during the demo and the classroom sessions.**

After you've completed this the login procedure, the Editor shows up again and you'll notice that a new area in the lower middle part of the Editor aprears.
This is the user workspace, where you can see all your data, e.g. batch jobs.

## Data Processing

We can build a process to run on the back-end with the following steps:

...

## Data Visualization

Data Visualization is still a bit limited in the Web Editor. It supports:

- GeoTiff (< 10MB) and cloud-optimized GeoTiffs. You can define composites for the available bands and apply a linear stretching.
- CSV. You can show CSV in a table and show the values in a scatter plot.
- GeoJSON will be shown on a map
- JSON
- PNG/JPEG

For full-fledged visualization capabilities we recommend to download the data and use your preferred tool to visualize the processed data, e.g. QGIS.
