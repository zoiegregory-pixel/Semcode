# Semcode

Population reporting coursework for SET09803 DevOps.

## Build and run

Requirements: JDK 17, Maven 3.9, and Docker Desktop (or Docker Engine).
Run these commands from the repository root:

```bash
mvn --batch-mode --no-transfer-progress clean verify
java -jar target/semcode.jar
docker build --tag semcode:local .
docker run --rm --network none semcode:local
```

The current starter prints `Semcode application started` and exits successfully.
The Maven Shade plugin packages the executable JAR as `target/semcode.jar`.
Do not use `target/original-semcode.jar` for Docker.

The Dockerfile uses Java 17 and runs as a non-root user. Build the JAR before
building the image: the Dockerfile copies it rather than running Maven itself.
The `.dockerignore` file allows only the Docker configuration and packaged JAR
into the build context. If the JAR filename changes, update the Dockerfile,
`.dockerignore`, and workflow together.

If Maven is not installed locally, Docker can build the JAR instead. On macOS
or Linux, run this from the repository root, then use the Docker commands above:

```bash
docker run --rm \
  --mount "type=bind,source=$(pwd),target=/workspace" \
  --workdir /workspace \
  maven:3.9-eclipse-temurin-17 \
  mvn --batch-mode --no-transfer-progress clean verify
```

## GitHub Actions

The **Java and Docker CI** workflow runs on pushes to `master`, `develop`,
`release`, `release/**`, and `feature/**`, and on pull requests targeting
`master`, `develop`, `release`, or `release/**`.

Each run:

1. Checks out the code and sets up Java 17 with Maven dependency caching.
2. Runs `mvn clean verify`, including Maven's test phases.
3. Runs the executable JAR.
4. Builds the Docker image and runs the application inside it.
5. Saves `semcode.jar` as the `semcode-jar` workflow artifact for 14 days.

Open the repository's **Actions** tab, select a run, and inspect the
**Build JAR and Docker image** job for build and runtime evidence. The JAR can
be downloaded from that run's artifacts. No Docker registry credentials or
shared personal access token are required; this workflow builds locally on
the GitHub runner and does not publish an image.

There are no automated unit or integration tests in the starter yet. The
workflow executes Maven's test phases, but a successful run currently proves
the build and startup checks only. Add meaningful tests as report logic is
implemented. When the application needs a database or becomes interactive,
adapt the startup checks and provide the required service configuration.

## Team workflow

Create feature branches from `develop`, open a pull request back into `develop`,
and request a teammate's review. Use the team's release process to deliver the
reviewed version to `master`. Track tasks as GitHub issues and on the team board.

The Code Review 1 Docker and CI evidence consists of a successful Maven build,
working application container, and successful GitHub Actions run. The team's
first release and remaining assessment checklist items are separate tasks.
