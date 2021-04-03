Fetches Sentry issue data into a PostgreSQL database for easier analysis.


# Prerequisites

 - a PostgreSQL database server
 - `jq`

Create a database for storing the data:
```
$ createdb my-sentry-db
$ psql -f schema/structure.sql my-sentry-db
```

An API token with `project:read` access is required. One can be generated at
https://sentry.io/settings/account/api/auth-tokens/. The token may be passed to
the `import` script either via the `-t` option or the `SENTRY_TOKEN` environment
variable.


# Usage

To fetch all issues and corresponding event data:
```
$ bin/import [-t TOKEN] [-q QUERY] PROJECT_SLUG DB
```

e.g.
```
$ bin/import -t ABC123 -q 'is:resolved NastyError' acme/backend sentry
```

The import script may be run multiple times. Newer events are imported for known
issues.


# Known issues

 - the Events API doesn't always return all events (according to the validation
   queries in `lib/validate.sql`). So, beware of doing raw number analysis on
   events.
