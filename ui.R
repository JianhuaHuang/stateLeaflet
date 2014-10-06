library(leaflet)
states <- map("state", plot=FALSE, fill=TRUE)

shinyUI(fluidPage(
  
  textOutput('eventOverInfo'),
  
  # create a div to contain leaflet Map, so that I can use percentage to 
  # control the heigth of the map
  # or else the heigth must be absolute px value (e.g. 500)
  div(class = 'mapContainer',
    leafletMap(
      "map", width = "100%", height = "100%",
      # By default OpenStreetMap tiles are used; we want nothing in this case
      initialTileLayer = "http://{s}.tiles.mapbox.com/v3/jianhua1122.j5f28jda
      /{z}/{x}/{y}.png",
      initialTileLayerAttribution = NULL,
      options=list(
        center = c(40, -98.85),
        zoom = 4)
    )    
    ),
  
  
  tags$head(tags$style("
    .leaflet-container { background-color: white !important; }

    .mapContainer {
      position: fixed;
      top: 50px;
      left: 0;
      right: 0;
      bottom: 50px;
      overflow: hidden;
      padding: 0;
    }

  "))   
#   tags$script("
#     $('#map').on('mouseover', function(e) {
#     var layer = e.target;
# 
#     layer.setStyle({
#         weight: 5,
#         color: '#666',
#         dashArray: '',
#         fillOpacity: 0.7
#     });
# 
#     if (!L.Browser.ie && !L.Browser.opera) {
#         layer.bringToFront();
#     }
#     }
#     ")
  
#   
#   tags$script('
#   $("#stateInfo").on("click", function() {
#      $("#stateInfo").hide();
#   });
#     
#   $("#map").on("click", function() {
#      $("#stateInfo").show();
#   });
#   ')
  
#   tags$script('
#     document.getElementById("stateInfo").onclick = function(e) {
#       $(this).fadeOut();
#       
#     }
#     
#     document.getElementById("map").onclick = function(e) {
#       $("#stateInfo").fadeIn();
#       e.preventDefault();
#     }
#   ')

))