# Use the official Nginx image as the base image
FROM nginx:latest

# Set the working directory
WORKDIR /usr/share/nginx/html

# Copy the hello.txt file into the Nginx root directory
COPY hello.txt /var/www/

# Update Nginx configuration to point to /var/www
RUN rm -rf /etc/nginx/conf.d/default.conf && \
    echo 'server { \
        listen 80; \
        server_name localhost; \
        root /var/www; \
        index hello.txt; \
    }' > /etc/nginx/conf.d/default.conf

# Install CloudWatch Agent
RUN apt-get update && \
    apt-get install -y curl unzip && \
    curl -O https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb && \
    dpkg -i -E ./amazon-cloudwatch-agent.deb && \
    rm -f ./amazon-cloudwatch-agent.deb

# Copy CloudWatch Agent configuration file
COPY  amazon-cloudwatch-agent.json/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json

# Expose port 80
EXPOSE 80

# Start CloudWatch Agent and Nginx
CMD ["/bin/bash", "-c", "/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a start -c file:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json -m ec2 && nginx -g 'daemon off;'"]
