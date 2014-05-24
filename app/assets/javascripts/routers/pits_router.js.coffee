class Projekti.Routers.Pits extends Backbone.Router
  routes:
    'pits/:id': 'show'
    '': 'index'
  initialize: (options) ->
    this.options = options || {}    
    @collection = new Projekti.Collections.Korisnici()
    @collection.reset($('#korisnici').data('korisnici')) 
    this.options.kolekcija_pitanja = new Projekti.Collections.Pits()
    this.options.kolekcija_pitanja.reset($('#sadrzaj').data('pitanja'))   
    this.options.kolekcija_komentara = new Projekti.Collections.Komentari()
    this.options.kolekcija_komentara.reset($('#komentari').data('komentari'))
    this.options.kolekcija_komentar = new Projekti.Collections.Komentar()
    this.options.kolekcija_komentar.reset($('#komentari').data('komentari'))    
  index: ->
    view = new Projekti.Views.PitsIndex(collection: @collection, collection2: this.options.kolekcija_pitanja, collection3: this.options.kolekcija_komentara)
    $('#sadrzaj').html(view.el)
    view.render()
  show: (id) ->
    broj = parseInt(id)    
    model_for_show = this.options.kolekcija_pitanja.findWhere({id: broj})
    model_korisnika = @collection.findWhere({id: model_for_show.get('user_id')})
    if model_korisnika?
      user_name= model_korisnika.get('username')
    else
      user_name = "Korisnik nije više aktivan"
    model_for_show.set({user_name: user_name});
    niz_komentara_za_pitanje = this.options.kolekcija_komentara.where({pit_id: broj})
    this.options.kolekcija_komentar.reset(niz_komentara_za_pitanje)
    view = new Projekti.Views.PitsShow(model: model_for_show, kolekcijica: @collection,  kolekcija: this.options.kolekcija_komentar)
    $('#sadrzaj').html(view.render().el)  