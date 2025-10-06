```sh
mysql -u devuser -p'developer' sakila
```

```sql
SHOW TABLES;
CREATE TABLE books( id_book INT AUTO_INCREMENT PRIMARY KEY, title VARCHAR(50), year DATE );
INSERT INTO books(title, year) VALUES('The Great Gatsby', '1925-04-10');
SELECT * FROM books;
```

```sh
virtctl vmexport download mariadb-server --vm=mariadb-server --output=mariadb-server-pvc.img

virtctl image-upload dv mariadb-server --size=10Gi --image-path=mariadb-server-pvc.img
virtctl create vm --name=mariadb-server-backup --volume-pvc=src:mariadb-server | oc apply -f -
```
