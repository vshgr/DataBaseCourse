CREATE TABLE "City" (
  "name" varchar,
  "region" varchar,
  PRIMARY KEY ("name", "region")
);

CREATE TABLE "Station" (
  "name" varchar PRIMARY KEY,
  "cityName" varchar,
  "regionName" varchar,
  "rracks" int
);

CREATE TABLE "Train" (
  "trainNr" int PRIMARY KEY,
  "length" int,
  "startStationName" varchar,
  "endStationName" varchar,
  "departureDateTime" timestamp,
  "arrivalDateTime" timestamp
);

ALTER TABLE "Station" ADD FOREIGN KEY ("name", "regionName") REFERENCES "City" ("name", "region");

ALTER TABLE "Train" ADD FOREIGN KEY ("startStationName") REFERENCES "Station" ("name");

ALTER TABLE "Train" ADD FOREIGN KEY ("endStationName") REFERENCES "Station" ("name");