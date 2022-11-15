CREATE TABLE IF NOT EXISTS genre (
	id SERIAL PRIMARY KEY,
	genre_name VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS executor (
	id SERIAL PRIMARY KEY,
	nickname VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS genre_executor (
	id_genre INTEGER NOT NULL REFERENCES genre(id),
	id_executor INTEGER NOT NULL REFERENCES executor(id),
	CONSTRAINT genre_executor_pk PRIMARY KEY (id_genre, id_executor)
);

CREATE TABLE IF NOT EXISTS album (
	id SERIAL PRIMARY KEY,
	album_name VARCHAR(80) NOT NULL UNIQUE,
	album_release DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS album_executor (
	id_executor INTEGER REFERENCES executor(id),
	id_album INTEGER REFERENCES album(id),
	CONSTRAINT album_executor_pk PRIMARY KEY (id_executor, id_album)
);

CREATE TABLE IF NOT EXISTS track (
	id SERIAL PRIMARY KEY,
	track_name VARCHAR(80) NOT NULL UNIQUE,
	track_length INTEGER NOT NULL,
	id_album INTEGER REFERENCES album(id)
);

CREATE TABLE IF NOT EXISTS songs_collection (
	id SERIAL PRIMARY KEY,
	name_collection VARCHAR(80) NOT NULL UNIQUE,
	songs_release DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS track_collection (
	id_track INTEGER REFERENCES track(id),
	id_songs_collection INTEGER REFERENCES songs_collection(id),
	CONSTRAINT track_collection_pk PRIMARY KEY (id_track, id_songs_collection)
);