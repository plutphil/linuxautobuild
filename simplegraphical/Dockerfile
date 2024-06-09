FROM debian:latest

# Add the build script
COPY build_linux.sh /build_linux.sh

# Make the script executable
RUN chmod +x /build_linux.sh

# Create output directory
RUN mkdir /output

# Run the build script
CMD ["/build_linux.sh"]