# Stage 1: Build crawljax-cli with Maven
FROM maven:3.9-eclipse-temurin-11 AS build

WORKDIR /build
COPY . .
RUN mvn -pl cli -am package -DskipTests --no-transfer-progress \
    && cp $(ls cli/target/crawljax-cli-*.jar | grep -v "\-tests\.jar" | head -1) \
          cli/target/crawljax-cli.jar

# Stage 2: Lightweight JRE runtime (browser provided via Selenium standalone container)
FROM eclipse-temurin:11-jre-jammy

# Create a non-root user
RUN useradd -m crawljax

WORKDIR /home/crawljax
RUN mkdir -p output && chown -R crawljax:crawljax /home/crawljax

# Copy the CLI jar and its runtime dependencies from the build stage
COPY --from=build /build/cli/target/crawljax-cli.jar ./crawljax-cli.jar
COPY --from=build /build/cli/target/lib/ ./lib/

USER crawljax

ENTRYPOINT ["java", "-jar", "/home/crawljax/crawljax-cli.jar"]
CMD ["--help"]
