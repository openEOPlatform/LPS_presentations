# Enhanced Vegetation Index

Calculate Sentinel-2 based EVI at 10m resolution for an area and time period.

The enhanced vegetation index (EVI) is an 'optimized' vegetation index designed to enhance the vegetation signal with improved sensitivity in high biomass regions and improved vegetation monitoring through a de-coupling of the canopy background signal and a reduction in atmosphere influences. 

[Link]https://en.wikipedia.org/wiki/Enhanced_vegetation_index

## Running it


"""
udp_public_url="https://openeo.vito.be/openeo/1.1/processes/u:dfa678cb9ab17f65d4f025e30fac5e0d90116176e44fd17d703419322747cbbd%40egi.eu/EVI"
polygon =  {"type":"Feature","geometry":{"type":"Polygon","coordinates":[[[5.169965489314347,51.250572485731965],[5.1709813825271,51.248670823679106],[5.178575420851998,51.24673809898954],[5.179170926259544,51.24985398556541],[5.169965489314347,51.250572485731965]]]},"properties":{}}
evi_exec = connection.datacube_from_process("EVI",namespace=udp_public_url, date=["2022-05-02","2022-05-06"], polygon=polygon)
evi_exec.download("test.nc")
"""

## Validation

This process is not yet validated! So use with care.


## Cost estimation

XX credits/ha