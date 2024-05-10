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
-------------------------------------------------------------------------
# this is poovarasan branch

# local setup

* create a .env in each services that contains all the details mentioned above.
* To run backend services use commands mentioned below
```
cd \backend\streamingService
npm install
node index.js
```
* for frontend
```
cd frontend
npm i
npm start
```
* you can get the sample output has mentioned below
![alt text](pics/image.png)


# Dockerfile

* create a docker file in both frontend and backend folder which helps to deploy application.
* Docker file are updated in specifies folder.

# Jenkins

* Create a jenkins pipeline to build and deploy the application in EC2 instance.
* make sure updated all the necesssary components for .env file in jenkin secreat file.
* Steps followed in jenkins file.
1. Checkout the code base from github.
```
stage('CHECKOUT') {
            steps {
                echo 'clone the git code' 
                git branch: 'poo', url:'https://github.com/garimas007/StreamingApp.git'
            }
        }
``` 
2. Created .env file.
3. Builld a docker file and pushed into docker repo.
```
stage('build backend') {
                    steps {
                        script {
                            docker.build("${env.DOCKER_IMAGE_BACKEND_stream}:${env.BUILD_ID}", './backend/streamingService/')
                            echo ("done")
                        }
                    }
                }
```
```
 docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials') {
                        docker.image("${env.DOCKER_IMAGE_BACKEND_stream}:${env.BUILD_ID}").push()
 }
```
4. Deploy the docker image in EC2 instance, you can get the output as mentioned below.

Frontend
![alt text](pics/image2.png)

Backend
![alt text](pics/image-1.png)

Next need to procede with terraform code to automate the creation of the instances and the configurations.