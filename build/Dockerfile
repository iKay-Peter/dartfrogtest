# Stage 1: Build the application
FROM dart:stable AS build

WORKDIR /app

# Resolve app dependencies
COPY pubspec.* ./
RUN dart pub get

# Copy app source code and compile it
COPY . .
RUN dart pub get --offline
RUN dart compile exe bin/server.dart -o bin/server

# Stage 2: Minimal runtime image
FROM gcr.io/distroless/cc

# Copy compiled binary
COPY --from=build /app/bin/server /app/bin/server

# Expose the server port
EXPOSE 8080

# Start the server
CMD ["/app/bin/server"]
