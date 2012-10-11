Names = ['Dirk','Timon','Sebastian','Chiel','Teun','Jens','Flip','Flop','Henk','Sander','NogWat']
Surnames = ['Blaat','Boe','Zoe','Bier','Pens','Hens','Laptop']

Titles = ['Title1','Title2','Title3','Title4','Title5','Title6']
Descriptions = ['Des1','Des2','Des3','Des4','Des5','Des6','Des7']

DoctorIds = ['1','2','3']

10.times do
  cur_name = "#{Names.sample} #{Surnames.sample}"

  Therapist.create(name: "#{cur_name}", email: "#{cur_name}@adelante.nl");
end

#Person.all().each do |pers| 
#	Dossier.create(person_id: "#{pers.id}")
#end

#Dossier.all().each do |dos|
#	Entry.create(dossier_id: "#{dos.id}", title: "#{Titles.sample}", description: "#{Descriptions.sample}")
#end

#Doctor.create(person_id: "1") Doctor.create(person_id: "2") Doctor.create(person_id: "3")

#Dossier.all.each do |dos|
#  Doctors_dossiers.create(dossier_id: "#{dos.id}", doctor_id: "#{DoctorIds.sample}")
#end