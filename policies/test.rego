package spacelift

admins  := { "danielle0876@gmail.com" }
allowed := { "" }
login   := input.session.login

admin { admins[login] }
allow { allowed[login] }

deny  { not admin; not allow }

# As input, login policies receive a JSON document like this:
#
# {
#   "request": {
#     "remote_ip": "string",
#     "timestamp_ns": "number - current Unix timestamp in nanoseconds"
#   },
#   "session": {
#     "login": "string",
#     "member": "boolean - is the user a member of the GitHub account",
#     "name": "string",
#     "teams": ["string"]
#   }
# }
#
# Based on this input, the policy may define boolean "allow", "admin" and "deny"
# rules. Positive outcome of at least one "deny" rule blocks the user from
# logging in to the account, no matter what the result of other rules is. Positive
# outcome of at least one "allow" rule allows the user to log in, while positive
# outcome of at least one "admin" gives them admin access on top of that, too.
# Note that "admin" automatically implies being able to log in, so you don't
# need to define a separate "allow" rule for that.
#
# ⚠️ In practice, any time you define an "allow" or "admin" rule, you should
# probably think of restricting access using a "deny" rule - most likely by
# disabling all non-members of the org - perhaps with a few exceptions:
#
# deny {
#   whitelist := {"luke", "leia", "yoda"}
#
#   not input.session.member
#   not whitelist[input.session.login]
# }
#
# Here's a few things you can do with login policies:
#
# 1) Give members of the DevOps team admin access to Spacelift, and read access
# to everyone else in the organization:
# admin {
#   input.session.teams[_] == "DevOps"
# }
#
# allow {
#   input.session.member
# }
#
# 2) Allow a bunch of external contributors to get non-admin access to your
# account:
# allow {
#   collaborators := {"alice", "bob", "charlene"}
#
#   collaborators[input.session.login]
# }
#
# 3) Only allow folks to log in on weekdays:
# deny {
#   today   := time.weekday(input.request.timestamp_ns)
#   weekend := {"Saturday", "Sunday"}
#
#   weekend[today]
# }
#
# 4) Allow organization members, iff they're logging in from the office:
# allow {
#   input.session.member
# }
#
# deny {
#   office := "12.34.56.0/24"
#
#   not net.cidr_contains(office, input.request.remote_ip)
# }
#
# Now go ahead and unleash your inner lawgiver. For more information on the rule
# language, please visit https://www.openpolicyagent.org/docs/latest/
