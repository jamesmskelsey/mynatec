# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

  Publication.create!(
    title: "Naval Air Systems Command Technical Publications Library Management Program",
    description: "pub about pubs",
    maintenance_level: "COMMON",
    path: "sample.pdf",
    pub_number: "00-25-100"
  )
  Publication.create!(
    title: "Basicis of Corrosion Control",
    description: "corrosion pub",
    maintenance_level: "COMMON",
    path: "sample2.pdf",
    pub_number: "01-1A-509-1"
  )
  PUBONE = Publication.first.id
  PUBTWO = Publication.second.id
  PartNumber.create!(number: "12345", niin: "013217654", publication_id: PUBONE)
  PartNumber.create!(number: "12345", niin: "013217654", publication_id: PUBTWO)
  PartNumber.create!(number: "123421", niin: "013217654", publication_id: PUBONE)
  PartNumber.create!(number: "freq532", niin: "013217654", publication_id: PUBTWO)
  PartNumber.create!(number: "654dsa", niin: "013217654", publication_id: PUBONE)
  PartNumber.create!(number: "8000001234", niin: "013217654", publication_id: PUBTWO)
  PartNumber.create!(number: "18115156", niin: "013217654", publication_id: PUBONE)
  PartNumber.create!(number: "8000003235", niin: "033237654", publication_id: PUBTWO)
  PartNumber.create!(number: "qwety", niin: "033237654", publication_id: PUBONE)
  PartNumber.create!(number: "asdf", niin: "033237654", publication_id: PUBTWO)
  PartNumber.create!(number: "asdf3234", niin: "033237654", publication_id: PUBONE)
  PartNumber.create!(number: "3234adsf", niin: "033237654", publication_id: PUBTWO)

  Library.create!(
    account: "31N2 0002A",
    maintenance_level: "I",
    uic: "R21533",
    attn: "Commanding Officer",
    activity: "USS ESSEX",
    address: "2 Essex Road",
    city_state_zip: "Backyard, OR 97123",
    poc_name: "AZ2 Who OnFirst",
    poc_email: "who.onfirst@lhd2.navy.mil",
    poc_phone: "555-123-9887",
    lead_ctpl: "AZ2 Onfirst",
    alt_ctpl: "AZ2 What LeftField",
    qa_monitor: "AE1 When Pitcher"
  )
    # :account, # i.e 31N2 0002A (wtf is with these account numbers anyways?)
    # :maintenance_level,  #OID
    # :uic,    # R21533
    # :attn,  # Commanding Officer, it's for building an address
    # :activity, # i.e. FRCNW, USS ESSEX
    # :address,
    # :city_state_zip,
    # :poc_name, # AZ2 Whos Onfirst
    # :poc_phone,
    # :poc_email,
    # :lead_ctpl,
    # :alt_ctpl,
    # :qa_monitor


def clean_date(date)
  mo_day_year = date.split(" ")[0]
  
  return mo_day_year.split("/")
end

[["16-30APM403-1","002","U","640",	"2BTYA48469",	"E","Auto-Add FROM PEMA Management","ALTIMETER SET TEST SET","03/13/2018 7:47:00 PM","0816LP1029771","/10/2017","/13/2018 7:47:00 PM"],
["16-30APN171-1","002","U","640","2BTYA48469","C","Auto-Add FROM PEMA Management","SERVICE INSTRUCTIONS WITH ILLUSTRATED PARTS BREAKDOWN ORGANIZATIONAL AND INTERMEDIATE LEVEL MAINTENANCE ELECTRONIC ALTIMETER SET AN/APN-171(V).HONEYWELL NO. YG9000D1 YG9000D3 YG9000D4 YG9000D16 MILITARY NO. AN/APN-171(V)1 AN/APN-171(V)3 AN/APN-171 (V)4 AN/APN-171(V)5","3/13/2018 7:47:00 PM","0816LP1143934","5/10/2017","3/13/2018 7:47:00 PM"],
["16-30APN171-2","002","U","610","2BTYA48469","E","Auto-Add FROM PEMA Management","OVERHAUL INSTRUCTIONS RECEIVER","03/13/2018 7:47:00 PM","0816LP1043939","05/10/2017","3/13/2018 7:47:00 PM"],
["16-30APN171-3","002","U","610","2BTYA48469","E","Auto-Add FROM PEMA Management","IPB RECEIVER NUMBER 962517A-1 962517A-4","03/13/2018 7:47:00 PM","0816LP8069200","5/10/2017","3/13/2018 7:47:00 PM"],
["16-30APN171-4","002","U","610","2BTYA48469","C","Auto-Add FROM PEMA Management","OVERHAUL INSTRUCTIONS DEPOT LEVEL MAINTEBABCE","03/13/2018 7:47:00 PM","0816LP1043915","5/10/2017","3/13/2018 7:47:00 PM"],
["16-30APN171-5","002","U","610","2BTYA48469","E","Auto-Add FROM PEMA Management","IPB TRANSMITTER P/N 962578-1,-4","03/13/2018 7:47:00 PM","0816LP2010020","5/10/2017","3/13/2018 7:47:00 PM"]].each do |entry|
  library = Library.first
  created = clean_date(entry[8])
  audit = clean_date(entry[10])
  library.entries.create(
    pub_number: entry[0], 
    copy_number: entry[1], 
    classification: entry[2],
    work_center: entry[3],
    pub_type: entry[5],
    title: entry[7],
  )
end


