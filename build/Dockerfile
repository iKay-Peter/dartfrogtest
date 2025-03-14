# Official Dart image for building
FROM dart:stable AS build

WORKDIR /app

# Resolve app dependencies
COPY pubspec.* ./
RUN dart pub get

# Copy app source code and compile it
COPY . .
RUN dart pub get --offline
RUN dart compile exe bin/server.dart -o bin/server

# Use a minimal runtime image
FROM gcr.io/distroless/cc
COPY --from=build /app/bin/server /app/bin/server

# Ensure executable permissions
RUN chmod +x /app/bin/server

# Expose server port
EXPOSE 8080

# Start server
CMD ["/app/bin/server"]
