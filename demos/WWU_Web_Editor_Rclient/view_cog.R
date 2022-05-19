# temporary function to view COGs via leaflet
# based on this issues in mapview:
# https://github.com/r-spatial/mapview/issues/400
# url for testing: url = "https://georaster-layer-for-leaflet.s3.amazonaws.com/GHS_POP_E2015_GLOBE_R2019A_4326_9ss_V1_0.tif"

library(leaflet)
library(leafem)

view_cog = function(url, min_scale = 0, max_scale = 1){
  
  js_scale = paste0("function (values) {
                    var scale = chroma.scale(['white', 'black']).domain([", min_scale, ",", max_scale, "]);
                    var val = values[0];
                    if (val === -200) return;
                    if (val < 0) return;
                    return scale(val).hex();
                    }")
  
  leaflet() %>% 
    addTiles(group = "osm") %>% 
    addProviderTiles("Esri.WorldImagery", group = "esri") %>%
    addProviderTiles("CartoDB.Positron", group = "db") %>% 
    addMapPane("cog", zIndex = 500) %>%
    leafem:::addCOG(
      url = url
      , group = "cog-layer"
      , opacity = 0.7
      , options = list(pane = "cog")
      , resolution = 96
      , autozoom = TRUE
      , colorOptions = colorOptions(
        palette = hcl.colors(3, "Inferno")
        , breaks = seq(0, 1, 0.2)
        , domain = c(0, 100)
        , na.color = "#ff00ff88"
      )
      , pixelValuesToColorFn = JS(js_scale)
    ) %>%
    addMouseCoordinates() %>%
    addLayersControl(
      baseGroups = c("osm", "esri", "db")
      , overlayGroups = "cog-layer"
    )
}
