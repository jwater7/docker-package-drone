# docker-package-drone

## Quick start (run with postgres)

~~~
docker run -d --restart=always -p 5432:5432 -e POSTGRES_PASSWORD=<secret> -v /root/psqldata:/var/lib/postgresql/data --name postgres postgres:latest

docker run -d --restart=always -p 80:8080 -v /root/package-dronedata/database.config:/var/lib/package-drone-server/cm/package/drone/database.config --name package-drone jwater7/package-drone:latest
docker exec -t package-drone cat /root/.drone-admin-token
user=admin
password=7dc8fc26b50a06a598edf2e6eea7f4a49b9b56d4c466417cc8c23b927bb60204
~~~

Then, open up a browser to http://<externalhostname>/ and log in and add the database connection like:

URL:

jdbc:postgresql://<externalhostname>/postgres

User:

postgres

Password:

<secret>

(then create a manager user to start creating channels)
