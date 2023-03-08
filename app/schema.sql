DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS logger;
DROP TABLE IF EXISTS proyect;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS proyectStatus;
DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS cars;
DROP TABLE IF EXISTS carBrands;
DROP TABLE IF EXISTS carModels;

CREATE TABLE user (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT UNIQUE NOT NULL,
    firstname TEXT NOT NULL,
    secondname TEXT NOT NULL,
    password TEXT NOT NULL,
    roleId INTEGER,
    proyId INTEGER,
    auth INTEGER,

    FOREIGN KEY (roleId) REFERENCES roles(id),
    FOREIGN KEY (proyId) REFERENCES proyect(id)
);

CREATE TABLE proyect (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    description TEXT UNIQUE NOT NULL,
    start DATE NOT NULL,
    end DATE NOT NULL,
    statusId INTEGER,

    FOREIGN KEY (statusId) REFERENCES proyectStatus(id)
);

CREATE TABLE logger (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    event TEXT NOT NULL,
    date TEXT NOT NULL,
    user TEXT NOT NULL
);

CREATE TABLE roles (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE proyectStatus (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

CREATE TABLE clients (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    dni TEXT NOT NULL,
    firstname TEXT NOT NULL,
    secondname TEXT NOT NULL,
    birthday TEXT NOT NULL,
    tlf TEXT NOT NULL,
    mail TEXT NOT NULL,
    adress TEXT NOT NULL
);

CREATE TABLE cars (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    ownerId INTEGER NOT NULL,
    plaque TEXT NOT NULL,
    brandId TEXT NOT NULL,
    modelId TEXT NOT NULL,
    year INTEGER NOT NULL,
    bodyWorkSerial TEXT NOT NULL,
    motorSerial TEXT NOT NULL,
    color TEXT NOT NULL,
    problem TEXT NOT NULL,

    FOREIGN KEY (ownerId) REFERENCES clients(id),
    FOREIGN KEY (brandId) REFERENCES carBrands(id),
    FOREIGN KEY (modelId) REFERENCES carModels(id)
);

CREATE TABLE carBrands (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    brandName TEXT NOT NULL
);

CREATE TABLE carModels (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    modelName TEXT NOT NULl
);