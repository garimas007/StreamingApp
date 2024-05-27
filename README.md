# StreamingApp
Collaborative Streaming application

## Backend

### AuthService
`.env` file for the Authentication Service.

```sh
PORT=3001
MONGO_URI="yourMongoDB_URIwithDatabaseName"
JWT_SECRET="writesomerandomsecrets"
AWS_KEY_ID='asfdasdfasfasf'
AWS_SECRET_KEY='adsafsasfdafs'
AWS_REGION='ap-south-1'
AWS_S3_BUCKET='streamingappservice'
```
------------------------------------------
# Project: DevOps Pipeline for MERN Stack Streaming Application

**Problem Statement:**

The objective is to develop a robust DevOps pipeline for a streaming application built on the MERN stack (MongoDB, Express.js, React, Node.js), where videos are uploaded to an AWS S3 bucket. This project encompasses the creation of a multi-stage Docker image for the application, ensuring scalability, security, monitoring, and efficient deployment strategies including blue-green deployments. The infrastructure automation will be managed using Terraform, while the database will be configured to run on-premise (locally on the learner's laptop). The project will also implement GitOps practices for continuous deployment, maintaining separate environments for staging, development, and production.

**Goals and Deliverables:**

1. Infrastructure as Code (IaC):
   - Use Terraform to provision and manage AWS cloud resources, including S3 buckets for video storage, EC2 instances for hosting the application, and necessary networking components.
   - Document the Terraform scripts and configurations for easy replication and deployment.

2. Dockerization and CI/CD Pipeline:
   - Develop a multi-stage Dockerfile for building lightweight, efficient images of the MERN stack application.
   - Set up Jenkins or GitHub Actions for continuous integration and delivery, automating the build, test, and deployment process across development, staging, and production environments.
   - Implement GitOps practices, using tools like ArgoCD or Flux for continuous deployment based on git repository changes.

3. Database Configuration:
   - Configure MongoDB to run locally on the learner's laptop, ensuring secure access and integration with the cloud-hosted application components.
   - Provide detailed setup and configuration instructions, including data backup and recovery procedures.

4. Security and Monitoring:
   - Implement security best practices, including the use of AWS IAM for access control, encryption of data in transit and at rest, and regular security audits.
   - Use Prometheus and Grafana for monitoring the application's performance and infrastructure health.
   - Configure alerts for any performance issues or security threats.

5. Deployment Strategy:
   - Implement a blue-green deployment strategy to minimize downtime and risk by maintaining two production environments.
   - Automate the switch-over process between blue and green environments, ensuring seamless deployment of new application versions.

6. Scalability and Backups:
   - Ensure the application is scalable, utilizing AWS Auto Scaling Groups to handle varying loads.
   - Automate the backup process for the S3 bucket and on-premise MongoDB database, including periodic backups and secure storage of backup data.

----------------------------------------------------------------
# Local setup

Firstly create a .env file for backend. Then to run the project,

**Backend**
cd backend/streamingService
npm i
node index.js

Create a .env file in this folder containing all the necessary details

**Frontend**
cd frontend
npm i
npm start

# Docker files

**Backend**

Create a Dockerfile in the streamingService directory and add the following lines:

FROM node:20
WORKDIR /app
COPY . .
RUN npm install
EXPOSE 3001
CMD [ "node","index.js" ]

Now build using:

docker build -t <image_name> .

Run the image using:

docker run -it -d -p <host_port>:3001 <image_name>

**Frontend**

Create a Dockerfile in the frontend directory and add the following lines:

FROM node:18
WORKDIR /app
COPY . .
RUN npm install
EXPOSE 3000
CMD [ "npm", "start" ]

Now build image:

docker build -t <image_name> .

Run the container by:

docker run -it -d -p <host_port>:3000 <image_name>

Prajjwal's Branch