CREATE TABLE issues (
"lastSeen" VARCHAR NOT NULL,
"numComments" INTEGER NOT NULL,
"userCount" INTEGER NOT NULL,
"culprit" VARCHAR NOT NULL,
"title" VARCHAR NOT NULL,
"id" VARCHAR NOT NULL,
"assignedTo" JSONB,
"logger" VARCHAR,
"stats" JSONB NOT NULL,
"type" VARCHAR NOT NULL,
"annotations" JSONB NOT NULL,
"metadata" JSONB NOT NULL,
"status" VARCHAR NOT NULL,
"subscriptionDetails" JSONB,
"isPublic" BOOLEAN NOT NULL,
"hasSeen" BOOLEAN NOT NULL,
"shortId" VARCHAR NOT NULL,
"shareId" VARCHAR,
"firstSeen" VARCHAR NOT NULL,
"count" VARCHAR NOT NULL,
"permalink" VARCHAR NOT NULL,
"level" VARCHAR NOT NULL,
"isSubscribed" BOOLEAN NOT NULL,
"isBookmarked" BOOLEAN NOT NULL,
"project" JSONB NOT NULL,
"statusDetails" JSONB NOT NULL
);

ALTER TABLE issues ADD PRIMARY KEY (id);

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

