class Projekti.Views.Paginacija extends Backbone.View

  template: JST['pits/paginacija']
  tagName: 'li'
      
  initialize: (options) ->
      this.options = options || {}
  
  render: ->
    $(@el).html(@template({page: this.options.page}))
    this