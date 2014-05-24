class Projekti.Views.Pitanje extends Backbone.View

  template: JST['pits/pitanje']
  tagName: 'li'
  className: 'list-group-item finger'    
  events:
    'click': 'prikaziPitanje'  
    
  initialize: (options) ->
      this.options = options || {}
  
  prikaziPitanje: ->
    new_url = 'pits/'+this.model.get('id')
    Backbone.history.navigate(new_url, {trigger: true})
    
  render: ->
    $(@el).html(@template({pitanje: this.model}))
    this