# in db/migrations/02_add_title_to_bookmarks.sql

ALTER TABLE bookmarks ADD COLUMN title VARCHAR(60);
