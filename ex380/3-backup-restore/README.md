```sh
oc -n lynx exec -it sts/mongo -- mongosh -u root -p mydb --authenticationDatabase admin
```

```js
use lynxdb
db.people.insertMany([
  { first_name: "Andi", last_name: "Saputra", age: 28, city: "Jakarta", email: "andi.saputra@example.com" },
  { first_name: "Budi", last_name: "Santoso", age: 34, city: "Bandung", email: "budi.santoso@example.com" },
  { first_name: "Citra", last_name: "Lestari", age: 26, city: "Surabaya", email: "citra.lestari@example.com" },
  { first_name: "Dewi", last_name: "Rahmawati", age: 31, city: "Yogyakarta", email: "dewi.rahmawati@example.com" },
  { first_name: "Eka", last_name: "Pratama", age: 29, city: "Medan", email: "eka.pratama@example.com" },
  { first_name: "Fajar", last_name: "Nurrahman", age: 27, city: "Semarang", email: "fajar.nurrahman@example.com" },
  { first_name: "Gina", last_name: "Putri", age: 30, city: "Malang", email: "gina.putri@example.com" },
  { first_name: "Hadi", last_name: "Setiawan", age: 35, city: "Bogor", email: "hadi.setiawan@example.com" },
  { first_name: "Indah", last_name: "Kusuma", age: 25, city: "Denpasar", email: "indah.kusuma@example.com" },
  { first_name: "Joko", last_name: "Wibowo", age: 33, city: "Palembang", email: "joko.wibowo@example.com" }
])
```
