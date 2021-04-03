CREATE TABLE events (
"eventID" VARCHAR NOT NULL,
"tags" JSONB NOT NULL,
"dateCreated" VARCHAR NOT NULL,
"user" JSONB,
"message" VARCHAR NOT NULL,
"id" VARCHAR NOT NULL,
"platform" VARCHAR NOT NULL,
"event.type" VARCHAR NOT NULL,
"groupID" VARCHAR NOT NULL,
"title" VARCHAR NOT NULL
);

ALTER TABLE events ADD PRIMARY KEY (id);

