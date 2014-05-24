class Projekti.Views.PitsIndex extends Backbone.View

  template: JST['pits/index']
  
  events:
    'submit #form_pitanje': 'dodajPitanje'
    'click #pag li': 'paginacijaStrana'
  
  initialize: (options) ->
    this.options = options || {}
    this.options.collection2.on('reset', @render, this)
    this.options.collection2.on('add', @izlistajPitanja, this)         
  render: ->
    $(@el).html(@template())
    parPage = 6
    pocetak = this.options.collection2.length - parPage
    pocetak = 0 if pocetak < 0
    for i in [pocetak...this.options.collection2.length]
      pitanje = this.options.collection2.models[i]
      kol_kom = this.options.collection3.where({pit_id: pitanje.get('id')})
      br_kom = kol_kom.length 
      rade = @collection.findWhere({id: pitanje.get('user_id')})
      if rade?
        user_name= rade.get('username')
      else
        user_name = "Korisnik nije više aktivan"
      pitanje.set({user_name: user_name, br_kom: br_kom});
      view = new Projekti.Views.Pitanje({ model: pitanje })
      @$('#lista_pitanja').prepend(view.render().el)
    this
    start = 1
    tmp = this.options.collection2.length / parPage
    tmp_end = Math.ceil(tmp) + 1
    the_end = parseInt(tmp_end)
    the_end = parPage if the_end > parPage
    for i in [start...the_end]
      pager = i
      view = new Projekti.Views.Paginacija({ page: pager })
      @$('#pag').append(view.render().el)
    @$('#pag').prepend("<li><a>«</a></li>")
    @$('#pag li').eq(1).addClass("active")
    @$('#pag').append("<li><a>»</a></li>")
    this
  dodajPitanje: (event) ->
    event.preventDefault()
    atributi = name: $('#novo_pitanje').val()
    this.options.collection2.create atributi,
    wait: true
    success: -> $('#form_pitanje')[0].reset()
    error: @hendlujGresku

  izlistajPitanja: (pitanje) =>
    rade = @collection.findWhere({id: pitanje.get('user_id')})
    br_kom = 0
    user_name= rade.get('username')
    pitanje.set({user_name: user_name, br_kom: br_kom});
    view = new Projekti.Views.Pitanje({ model: pitanje })
    @$('#lista_pitanja').prepend(view.render().el)    

  hendlujGresku: (pitanje, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribut, messages of errors
        alert "#{attribut} #{message}" for message in messages
        
  paginacijaStrana: (event) -> 
    event.preventDefault()
    @$('#lista_pitanja').empty()
    parPage = 6
    limit_stranica = 5
    strana = $($(event.target).get(0)).html()
    if strana == "«"
      pocetak = this.options.collection2.length - parPage
      pocetak = 0 if pocetak < 0
      kraj = this.options.collection2.length
    else if strana == "»"
      pocetak = 0
      kraj = parPage
    else  
      bpm = parseInt(strana)
      pocetak = this.options.collection2.length - bpm * parPage
      pocetak = 0 if pocetak < 0
      kraj = pocetak + parPage
    for i in [pocetak...kraj]
      pitanje = this.options.collection2.models[i]
      kol_kom = this.options.collection3.where({pit_id: pitanje.get('id')})
      br_kom = kol_kom.length 
      rade = @collection.findWhere({id: pitanje.get('user_id')})
      if rade?
        user_name= rade.get('username')
      else
        user_name = "Korisnik nije više aktivan"
      pitanje.set({user_name: user_name, br_kom: br_kom});
      view = new Projekti.Views.Pitanje({ model: pitanje })
      @$('#lista_pitanja').prepend(view.render().el)
    this
    @$('#pag').empty()
    tmp = this.options.collection2.length/parPage
    max_stranica = Math.ceil(tmp)    
    if strana == "«"
      if max_stranica < limit_stranica
        start = 1
        the_end = max_stranica + 1
        pozicija = 1
      else if  max_stranica >= limit_stranica
        start = 1
        the_end = limit_stranica + 1
        pozicija = 1  
    else if strana == "»"
        start = max_stranica - 4
        start = 1 if start < 1
        the_end = max_stranica + 1
        pozicija = 5
        pozicija = max_stranica if max_stranica <= pozicija
    else                    
      stranica = parseInt(strana)
      if max_stranica < limit_stranica
        start = 1
        the_end = max_stranica + 1
        pozicija = stranica
      else if max_stranica >= limit_stranica
        if stranica == 1
          start = 1
          the_end = limit_stranica + 1
          pozicija = 1
        else if stranica == 2
          start = 1
          the_end = limit_stranica + 1
          pozicija = 2
        else if stranica ==  max_stranica
          start = max_stranica - 4
          the_end = max_stranica + 1
          pozicija = 5           
        else if stranica ==  max_stranica - 1
          start = max_stranica - 4
          the_end = max_stranica + 1
          pozicija = 4
        else
          start = stranica - 2
          the_end = stranica + 3
          pozicija = 3 
    for i in [start...the_end]
      pager = i
      view = new Projekti.Views.Paginacija({ page: pager })
      @$('#pag').append(view.render().el)
    @$('#pag').prepend("<li><a>«</a></li>") 
    @$('#pag li').eq(pozicija).addClass("active")
    @$('#pag').append("<li><a>»</a></li>")
    this