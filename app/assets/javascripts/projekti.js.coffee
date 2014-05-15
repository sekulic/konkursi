window.Projekti =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Projekti.Routers.Pits()
    Backbone.history.start({root: "/forum/"})

$(document).ready ->
  Projekti.initialize()
  
$(document).on 'page:load', ->
  Backbone.history.stop()
  Projekti.initialize()  
