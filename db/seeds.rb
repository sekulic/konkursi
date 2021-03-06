# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or find_or_create_by_named alongside the db with db:setup).
#
# Examples:
#
#   cities = City.find_or_create_by_name([{ name: 'Chicago' }, { name: 'Copenhagen' }])
User.find_or_create_by_email(:email => 'sekulic.radosav@yahoo.com', :password => 'foobar123', :password_confirmation => 'foobar123', :username => 'ADMIN', :admin => true)
Vrste.find_or_create_by_name(name: 'Bespovratna sredstva')
Vrste.find_or_create_by_name(name: 'Javna nabavka - proizvodi')
Vrste.find_or_create_by_name(name: 'Javna nabavka - usluge')
Vrste.find_or_create_by_name(name: 'Javna nabavka - radovi')
Status.find_or_create_by_name(name: 'Aktuelan konkurs')
Status.find_or_create_by_name(name: 'Konkurs u najavi')
Valuta.find_or_create_by_name(name: 'EUR')
Valuta.find_or_create_by_name(name: 'RSD')
Sektori.find_or_create_by_name(name: 'Životna sredina')
Sektori.find_or_create_by_name(name: 'Mladi')
Sektori.find_or_create_by_name(name: 'Informacione i komunikacione tehnologije')
Sektori.find_or_create_by_name(name: 'Demokratizacija i dobro upravljanje')
Sektori.find_or_create_by_name(name: 'Energija')
Sektori.find_or_create_by_name(name: 'Hrana')
Sektori.find_or_create_by_name(name: 'Preduzetništvo')
Sektori.find_or_create_by_name(name: 'Promet')
Sektori.find_or_create_by_name(name: 'Obrazovanje')
Sektori.find_or_create_by_name(name: 'Mediji')
Sektori.find_or_create_by_name(name: 'Zdravlje')
Sektori.find_or_create_by_name(name: 'Kultura')
Sektori.find_or_create_by_name(name: 'Prekogranična saradnja')
Sektori.find_or_create_by_name(name: 'Društvo i društvene nauke')
Sektori.find_or_create_by_name(name: 'Nauka i tehnologija')
Sektori.find_or_create_by_name(name: 'Svemir')
Sektori.find_or_create_by_name(name: 'Poljoprivreda')
Sektori.find_or_create_by_name(name: 'Sigurnost')
Sektori.find_or_create_by_name(name: 'Infrastruktura')
Sektori.find_or_create_by_name(name: 'Zapošljavanje')
Sektori.find_or_create_by_name(name: 'Turizam')
Sektori.find_or_create_by_name(name: 'Ostalo')
Aplikant.find_or_create_by_name(name: 'Tela državne uprave izuzev Vlade i ministarstava')
Aplikant.find_or_create_by_name(name: 'Jedinice lokalne samouprave')
Aplikant.find_or_create_by_name(name: 'Mala i srednja preduzeća')
Aplikant.find_or_create_by_name(name: 'Velika preduzeća')
Aplikant.find_or_create_by_name(name: 'Udruženja')
Aplikant.find_or_create_by_name(name: 'Udruženja poslodavaca')
Aplikant.find_or_create_by_name(name: 'Sindikati')
Aplikant.find_or_create_by_name(name: 'Zadruge')
Aplikant.find_or_create_by_name(name: 'Instituti')
Aplikant.find_or_create_by_name(name: 'Fakulteti')
Aplikant.find_or_create_by_name(name: 'Neformalna udruženja i inicijative')
Aplikant.find_or_create_by_name(name: 'Poljoprivredna gazdinstva')
Aplikant.find_or_create_by_name(name: 'Fizička lica')
Aplikant.find_or_create_by_name(name: 'Ministarstva')
Aplikant.find_or_create_by_name(name: 'Razvojne agencije')
Aplikant.find_or_create_by_name(name: 'Preduzetnički inkubatori')
Aplikant.find_or_create_by_name(name: 'Klasteri')
Aplikant.find_or_create_by_name(name: 'Osnovne škole')
Aplikant.find_or_create_by_name(name: 'Srednje škole')
Aplikant.find_or_create_by_name(name: 'Ustanove')
Aplikant.find_or_create_by_name(name: 'Ostalo')