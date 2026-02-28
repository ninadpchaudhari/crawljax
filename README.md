Crawljax 
========

Crawljax is a tool for automatically crawling and testing modern web applications. 
Crawljax can explore any (even single-page dynamic JavaScript-based) web application through an event-driven dynamic crawling engine.
It produces as output a state-flow graph of the dynamic DOM states and the event-based transitions between them.
Crawljax can easily be extended through its easy-to-use [plugin architecture](https://github.com/crawljax/crawljax/wiki/Writing-a-plugin).

Docker
------

### Quick start with Docker Compose

The repository ships a `Dockerfile` and a `docker-compose.yml` that build Crawljax from source
and wire it up with a [Selenium standalone-Chrome](https://github.com/SeleniumHQ/docker-selenium)
container so you do not need a local browser or Java installation.

**Prerequisites:** Docker and Docker Compose.

```bash
# Build the image and run the default crawl of http://example.com (2-minute timeout)
docker-compose up --build

# The crawl results are written to ./output on the host
```

To crawl a different URL, override the `crawljax` service command at runtime:

```bash
docker-compose run --rm crawljax \
  https://your-site.example.com /home/crawljax/output \
  -b REMOTE \
  -browserRemoteUrl http://selenium:4444/wd/hub \
  -t 5 -o
```

You can watch the browser live at <http://localhost:7900> (password: `secret`) while the crawl
is running.

### Build the Docker image manually

```bash
docker build -t crawljax-cli .
```

Run the CLI help to verify the image:

```bash
docker run --rm crawljax-cli --help
```

Maven
-----
Crawljax releases are available on [Maven central repository](https://central.sonatype.com/search?smo=true&q=crawljax).

	<dependency>
	    <groupId>com.crawljax</groupId>
	    <artifactId>crawljax-core</artifactId>
	    <version>${crawljax-version}</version>
	</dependency>

Documentation
-------------

You can find more technical documentation in our [project wiki](https://github.com/crawljax/crawljax/wiki/). 


Community
---------

Keep track of development and community news.

* We welcome [contributions](https://github.com/crawljax/crawljax/blob/master/CONTRIBUTING.md)!
* Follow [@crawljax](https://twitter.com/crawljax) on Twitter.


Changelog
---------

Detailed change history is available in our [changelog](https://github.com/crawljax/crawljax/blob/master/CHANGELOG.md).
