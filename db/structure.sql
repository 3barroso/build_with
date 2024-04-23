CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "companies" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "slug" varchar);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE IF NOT EXISTS "addresses" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "street" varchar, "postal_code" varchar, "street_number" varchar, "city" varchar, "state" varchar, "fips_code" varchar, "country" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "location_type" integer, "county" varchar);
CREATE UNIQUE INDEX "index_addresses_on_street_and_street_number_and_city_and_state" ON "addresses" ("street", "street_number", "city", "state");
CREATE TABLE IF NOT EXISTS "active_storage_blobs" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "key" varchar NOT NULL, "filename" varchar NOT NULL, "content_type" varchar, "metadata" text, "service_name" varchar NOT NULL, "byte_size" bigint NOT NULL, "checksum" varchar, "created_at" datetime(6) NOT NULL);
CREATE UNIQUE INDEX "index_active_storage_blobs_on_key" ON "active_storage_blobs" ("key");
CREATE TABLE IF NOT EXISTS "active_storage_attachments" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar NOT NULL, "record_type" varchar NOT NULL, "record_id" bigint NOT NULL, "blob_id" bigint NOT NULL, "created_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_c3b3935057"
FOREIGN KEY ("blob_id")
  REFERENCES "active_storage_blobs" ("id")
);
CREATE INDEX "index_active_storage_attachments_on_blob_id" ON "active_storage_attachments" ("blob_id");
CREATE UNIQUE INDEX "index_active_storage_attachments_uniqueness" ON "active_storage_attachments" ("record_type", "record_id", "name", "blob_id");
CREATE TABLE IF NOT EXISTS "active_storage_variant_records" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "blob_id" bigint NOT NULL, "variation_digest" varchar NOT NULL, CONSTRAINT "fk_rails_993965df05"
FOREIGN KEY ("blob_id")
  REFERENCES "active_storage_blobs" ("id")
);
CREATE UNIQUE INDEX "index_active_storage_variant_records_uniqueness" ON "active_storage_variant_records" ("blob_id", "variation_digest");
CREATE TABLE IF NOT EXISTS "adventures" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar DEFAULT NULL, "description" text DEFAULT NULL, "status" integer DEFAULT NULL, "shareable" integer DEFAULT NULL, "active" boolean DEFAULT NULL, "target_completion" datetime(6) DEFAULT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "adventure_addresses" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "address_id" integer, "adventure_id" integer, "name" varchar, "description" text, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE INDEX "index_adventure_addresses_on_address_id" ON "adventure_addresses" ("address_id");
CREATE INDEX "index_adventure_addresses_on_adventure_id" ON "adventure_addresses" ("adventure_id");
CREATE UNIQUE INDEX "index_companies_on_slug" ON "companies" ("slug");
INSERT INTO "schema_migrations" (version) VALUES
('20240423194134'),
('20240417190607'),
('20240411182921'),
('20240325003334'),
('20240324214859'),
('20240324003700'),
('20240323023103'),
('20240318175329'),
('20240318175011'),
('20240318042108');

