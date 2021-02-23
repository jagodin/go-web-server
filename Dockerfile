FROM golang:1.16.0-buster

# Create directory /app for our server
RUN mkdir /app

# Copy the contents of working directory to /app
COPY . /app

# Change the working directory to /app
WORKDIR /app

# Put GO111MODULE to auto since there is not go.mod file for our server
RUN go env -w GO111MODULE=auto

# Build the server
RUN go build -o main .

# Set the port and expose it
ENV PORT=5000
EXPOSE $PORT

# Run the server
CMD ["/app/main"]