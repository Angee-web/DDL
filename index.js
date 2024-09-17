
const express = require("express");
const mysql = require("mysql2");

const app = express();
const port = 3200;

const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "Dabu6039###",
  database: "ddl_db",
});

connection.connect();

app.get("/customer", (req, res) => {
  connection.query("SELECT * FROM Customer", (err, results) => {
    if (err) {
      res.status(500).send("Database query error");
      return;
    }
    res.json(results);
  });
});

app.get("/product", (req, res) => {
  connection.query("SELECT * FROM Product", (err, results) => {
    if (err) {
      res.status(500).send("Database query error");
      return;
    }
    res.json(results);
  });
});

app.get("/order", (req, res) => {
    connection.query("SELECT * FROM Orders", (err, results) => {
        if (err) {
        res.status(500).send("Database query error");
        return;
        }
        res.json(results);
    });
    });

    app.get("/productdescription", (req, res) => {
        connection.query("DESCRIBE Product", (err, results) => {
            if (err) {
            res.status(500).send("Database query error");
            return;
            }
            res.json(results);
        });
    });

    app.get("/customerdescription", (req, res) => {
        connection.query("DESCRIBE Customer", (err, results) => {
            if (err) {
            res.status(500).send("Database query error");
            return;
            }
            res.json(results);
        });
    });

    app.get("/orderdescription", (req, res) => {
        connection.query("DESCRIBE Orders", (err, results) => {
            if (err) {
            res.status(500).send("Database query error");
            return;
            }
            res.json(results);
        });
    });


app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
