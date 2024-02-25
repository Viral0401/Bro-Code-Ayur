class Doctor{
  final String id;
  final String name;
  final String specialist;
  final String experience;
  final String patients;
  const Doctor({required this.id, required this.name, required this.specialist, required this.experience, required this.patients});
}
List<Doctor> doctors=[
  const Doctor(id: "1", name: "Dr. Ram", specialist: "Cardeo Surgeon", experience: "10 years", patients: "1.6 K"),
  const Doctor(id: "2", name: "Dr. Hargun", specialist: "Surgeon", experience: "12 years ", patients: "1.3 K"),
  const Doctor(id: "3", name: "Dr. Krishna", specialist: "Surgeon", experience: "14 years", patients: "4.5k"),
  const Doctor(id: "4", name: "Dr. Rajesh", specialist: "Surgeon", experience: "12 years", patients: "800"),
  const Doctor(id: "5", name: "Dr. Ritkesh", specialist: "Kidney Specialist", experience: "12 Years", patients: "1.1K"),
  const Doctor(id: "6", name: "Dr. Raju", specialist: "Pancreatic", experience: "6 Years", patients: "2.5K"),
  const Doctor(id: "7", name: "Dr. Rakesh", specialist: "Liver Surgeon", experience: "11 Years", patients: "1K"),
  const Doctor(id: "8", name: "Dr. Kripa", specialist: "Surgeon", experience: "2 years", patients: "500"),
];