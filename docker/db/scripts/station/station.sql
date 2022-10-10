CREATE TABLE "Station" (
  "name" varchar,
  "tracks" int,
  "cityName" varchar,
  "cityRegion" varchar,
  PRIMARY KEY ("name"),
  FOREIGN KEY ("cityName", "cityRegion") REFERENCES "City"("cityName", "cityRegion")
);

CREATE TABLE "City" (
  "cityName" varchar,
  "cityRegion" varchar,
  PRIMARY KEY ("cityName", "cityRegion")
);

CREATE TABLE "Connection" (
  "trainNumber" int REFERENCES "Train"("number"),
  "fstationName" varchar REFERENCES "Station"("name"),
  "sstationName" varchar REFERENCES "Station"("name"),
  "arrival" date,
  "departure" date,
  PRIMARY KEY ("trainNumber", "fstationName", "sstationName")
);

CREATE TABLE "Train" (
  "number" int,
  "length" int,
  "fstationName" varchar REFERENCES "Station"("name"),
  "sstationName" varchar REFERENCES "Station"("name"),
  PRIMARY KEY ("number")
);

