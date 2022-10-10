CREATE TABLE "Station" (
  "statNr" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "Patient" (
  "patientNr" int PRIMARY KEY,
  "name" varchar,
  "disease" varchar,
  "statNr" int,
  "roomNr" int,
  "admissionFrom" date,
  "admissionTo" date,
  "doctorNr" int
);

CREATE TABLE "Room" (
  "statNr" int,
  "roomNr" int,
  "beds" int,
  PRIMARY KEY ("StatNr", "RoomNr")
);

CREATE TABLE "Doctor" (
  "persNr" int PRIMARY KEY,
  "area" varchar,
  "rank" varchar
);

CREATE TABLE "StationPersonnel" (
  "persNr" int PRIMARY KEY,
  "name" varchar,
  "stationNr" int
);

CREATE TABLE "Caregiver" (
  "persNr" int PRIMARY KEY,
  "qualification" varchar
);

ALTER TABLE "Patient" ADD FOREIGN KEY ("doctorNr") REFERENCES "Doctor" ("persNr");

ALTER TABLE "Room" ADD FOREIGN KEY ("statNr") REFERENCES "Station" ("statNr");

ALTER TABLE "StationPersonnel" ADD FOREIGN KEY ("persNr") REFERENCES "Doctor" ("persNr");

ALTER TABLE "StationPersonnel" ADD FOREIGN KEY ("stationNr") REFERENCES "Station" ("statNr");

ALTER TABLE "Station" ADD FOREIGN KEY ("statNr") REFERENCES "Caregiver" ("persNr");

ALTER TABLE "Patient" ADD FOREIGN KEY ("statNr") REFERENCES "Station" ("statNr");

ALTER TABLE "Patient" ADD FOREIGN KEY ("statNr", "roomNr") REFERENCES "Room" ("statNr", "roomNr");