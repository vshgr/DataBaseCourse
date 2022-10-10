CREATE TABLE "Book" (
  "ISBN" int,
  "title" int,
  "author" varchar,
  "pagesNum" int,
  "pubYear" int,
  "pubName" varchar,
  PRIMARY KEY ("ISBN")
);

CREATE TABLE "BookCopy" (
  "copyID" int,
  "ISBN" int,
  "position" int,
  PRIMARY KEY ("copyID", "ISBN")
);

CREATE TABLE "Rent" (
    "ISBN" int,
  "copyID" int,
  "readerID" int,
  "returnDate" date,
  PRIMARY KEY ("copyID", "readerID", "ISBN")
);

CREATE TABLE "Reader" (
  "readerID" int,
  "lastName" varchar,
  "firstName" varchar,
  "adress" varchar,
  "birthDate" date,
  PRIMARY KEY ("readerID")
);

CREATE TABLE "Category" (
  "categoryName" varchar,
  "parentCat" varchar,
  PRIMARY KEY ("categoryName")
);

CREATE TABLE "BookCategory" (
  "ISBN" int,
  "categoryName" varchar,
  PRIMARY KEY ("categoryName", "ISBN")
);

CREATE TABLE "Publisher" (
  "name" varchar,
  "adress" varchar,
  PRIMARY KEY ("name")
);

ALTER TABLE "BookCopy" ADD FOREIGN KEY ("ISBN") REFERENCES "Book" ("ISBN");

ALTER TABLE "Rent" ADD FOREIGN KEY ("copyID", "ISBN") REFERENCES "BookCopy" ("copyID", "ISBN");

ALTER TABLE "Rent" ADD FOREIGN KEY ("readerID") REFERENCES "Reader" ("readerID");

ALTER TABLE "Category" ADD FOREIGN KEY ("parentCat") REFERENCES "Category" ("categoryName");

ALTER TABLE "BookCategory" ADD FOREIGN KEY ("categoryName") REFERENCES "Category" ("categoryName");

ALTER TABLE "BookCategory" ADD FOREIGN KEY ("ISBN") REFERENCES "Book" ("ISBN");

ALTER TABLE "Book" ADD FOREIGN KEY ("pubName") REFERENCES "Publisher" ("name");
