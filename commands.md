##On the bash prompt
```$cockroach demo```

##In the cockroach shell
```
CREATE DATABSE example;
USE example;
```

```
CREATE TABLE names(name varchar(50), email varchar(100));
INSERT INTO names(name, email) VALUES('myname fullname', 'myname@gmail.com');
INSERT INTO names(name, email) VALUES('foo bar', 'someone@gmail.com');
SELECT * FROM names;
SELECT * FROM names WHERE email='someone@gmail.com';
```


