class Projekti.Views.Komentar extends Backbone.View

  template: JST['pits/komentar']
  tagName: 'li'
  className: 'list-group-item'     
    
  initialize: (options) ->
      this.options = options || {}
    
  render: ->
    $(@el).html(@template({komentar: this.model}))
    this