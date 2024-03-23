CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "companies" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE IF NOT EXISTS "addresses" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "street" varchar, "postal_code" varchar, "street_number" varchar, "city" varchar, "state" varchar, "fips_code" varchar, "country" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "location_type" integer);
CREATE UNIQUE INDEX "index_addresses_on_street_and_street_number_and_city_and_state" ON "addresses" ("street", "street_number", "city", "state");
INSERT INTO "schema_migrations" (version) VALUES
('20240323023103'),
('20240318175329'),
('20240318175011'),
('20240318042108');

