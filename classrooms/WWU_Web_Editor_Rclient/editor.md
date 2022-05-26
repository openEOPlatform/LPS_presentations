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

### NDVI (Beginners)

#### Do It Yourself

1. Add the collection `SENTINEL_L2A` and change the parameters to your preferred spatial extent and choose a temporal extent such as `2018-01-01` - `2019-01-01`.
2. Add the `ndvi` process. Then connect the result of `SENTINEL_L2A` with the `data` parameter of the `ndvi` process. You don't need to set any parameters, the service automatically detects the right bands for you.
3. Add the `aggregate_spatial` process. Then connect the result of the `ndvi` process with the `data` parameter of the newly added process. You need to change several parameters:
  1. Select some geometries you want to get information for, e.g. by adding a number of points or polygons to the map.
  2. Select a reducer by adding a process such as `mean` or `max`. You need to connect the `data` Process Parameter with the `data` parameter of the newly added process and then save your input.
4. Now we want to save the result. Add the `save_result` process and choose the `JSON` format. Connect the result of the `aggregate_spatial` process with the `data` parameter of the newly added process.
5. Now you can run the workflow by clicking `Run / Preview`.
6. After some time, the right side will show a table of data. You can click some or all the columns and a scatter chart will be shown for the NDVI values per day for the geometries given in step 3.

#### Copy & Paste

If you don't want to click through the DIY instructions, you can also simply copy the workflow instructions into the "Code" tab and run the workflow:

```json
{
  "process_graph": {
    "1": {
      "process_id": "ndvi",
      "arguments": {
        "data": {
          "from_node": "load_collection_LUCZT2231M"
        }
      }
    },
    "load_collection_LUCZT2231M": {
      "process_id": "load_collection",
      "arguments": {
        "id": "SENTINEL2_L2A",
        "spatial_extent": {
          "west": 6.631536,
          "east": 6.646557,
          "south": 50.811346,
          "north": 50.82171
        },
        "temporal_extent": [
          "2018-01-01",
          "2019-01-01"
        ],
        "properties": {}
      }
    },
    "aggregate_spatial_CCEOQ0715M": {
      "process_id": "aggregate_spatial",
      "arguments": {
        "data": {
          "from_node": "1"
        },
        "geometries": {
          "type": "FeatureCollection",
          "features": [
            {
              "type": "Feature",
              "geometry": {
                "type": "Point",
                "coordinates": [
                  6.635957000000001,
                  50.81649999999999
                ]
              },
              "properties": null
            },
            {
              "type": "Feature",
              "geometry": {
                "type": "Point",
                "coordinates": [
                  6.645705805859292,
                  50.815872160671944
                ]
              },
              "properties": null
            },
            {
              "type": "Feature",
              "geometry": {
                "type": "Point",
                "coordinates": [
                  6.639779911640814,
                  50.81251388216188
                ]
              },
              "properties": null
            },
            {
              "type": "Feature",
              "geometry": {
                "type": "Point",
                "coordinates": [
                  6.638996935621862,
                  50.813908103975905
                ]
              },
              "properties": null
            }
          ]
        },
        "reducer": {
          "process_graph": {
            "1": {
              "process_id": "max",
              "arguments": {
                "data": {
                  "from_parameter": "data"
                }
              },
              "result": true
            }
          }
        }
      }
    },
    "save_result_EQSTN1107P": {
      "process_id": "save_result",
      "arguments": {
        "data": {
          "from_node": "aggregate_spatial_CCEOQ0715M"
        },
        "format": "JSON"
      },
      "result": true
    }
  }
}
```

By the way, you can also export the workflow into code, e.g. in Python or R.

## Data Visualization

Data Visualization is still a bit limited in the Web Editor. It supports:

- GeoTiff (< 10MB) and cloud-optimized GeoTiffs. You can define composites for the available bands and apply a linear stretching.
- CSV. You can show CSV in a table and show the values in a scatter plot.
- GeoJSON will be shown on a map.
- JSON. JSON with table-like date can be used similar to CSV files and also show scatter plots of the data.
- PNG/JPEG. For hassle-free quick visualizations/previews.

For full-fledged visualization capabilities we recommend to download the data and use your preferred tool to visualize the processed data, e.g. QGIS.
