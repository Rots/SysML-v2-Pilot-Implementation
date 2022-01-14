FROM docker.io/maven:3.6-adoptopenjdk-11

COPY . /repo

WORKDIR /repo

# A bit of caching so it's faster to test the failing conditions
RUN mvn install

#RUN .ci/release.sh
RUN mvn versions:set -DremoveSnapshot=true -DgenerateBackupPoms=false --batch-mode org.eclipse.tycho:tycho-versions-plugin:2.7.5:update-eclipse-metadata
#RUN ./mvnw versions:set -DremoveSnapshot=true --batch-mode

