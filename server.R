shinyServer(function(input, output, session) {

  map <- createLeafletMap(session, "map")
  
  observe({
    if (is.null(input$map_click)) {
      return()
    }
  })
  
  # session$onFlushed is necessary to delay the drawing of the polygons until
  # after the map is created
  session$onFlushed(once= T, function() {
  
    map$addPolygon(states$y, states$x, states$names,
      lapply(brewer.pal(7, "Set1"), function(x) {
        list(fillColor = x)
      }),
      list(fill=T, fillColor="#800026", fillOpacity=.6, 
        stroke=TRUE, opacity=1, color="white", weight=1.5, dashArray = '3' 
      )
    )
    
  })
  
  observe({   
    # mouseover event (eventOver)
    # when the pointer is over a state, highlight that state and 
    # show information. layerID of addPolygon should be set as "sameID"
    # or any other name, so that the previou states are not highlighted.
    
    # when the highlighted state polygon is added, the eventOver$id will be 
    # updated to 's' (this is weird!). In order to avoid capturing the 
    # highlited state set return() when eventOver$id == 's'. 
    eventOver <- input$map_shape_mouseover
    if (is.null(eventOver)||eventOver$id == 's') {
      return()
    }
    
#     stateOverName <- strsplit(eventOver$id, '.', fixed = T)[[1]][1]
#     stateOverId <- grep(stateOverName, names(eachState))
#     stateOver <- statesDF[grep(stateOverName, statesDF$region), ]
#     
#     lapply(stateOverId, function(x) {
#       map$addPolygon(eachState[[x]]$lat, 
#         eachState[[x]]$long, 
#         paste('sameID', x))
#     })
    
    stateOver <- eachState[[eventOver$id]]
        
    map$addPolygon(stateOver$lat, stateOver$long, 'sameID') 
    
    output$eventOverInfo <- renderPrint({(eventOver$id)})    
  })
})          
#       eventClick <- input$map_shape_click
#       if (is.null(eventClick)) {
#         return()
#       }     
      
#       stateClicked <- statesDF[statesDF$region == eventClick$id, ]
      
#       output$stateInfo <- renderUI(
#         if(!is.null(eventClick))
#           selectInput(inputId='EIA.display.column',
#             label = ('Select columns to display (use "ctrl" key for multiple selection)'),
#             choices = c('choice1', eventClick$id),  # exclude the PLANT_NAME, which is displayed by default
#             selected = eventClick)
#       )
      
#       output$eventClickID <- renderPrint({eventClick})
#       
#       output$stateData <- renderPrint({head(stateClicked)})



