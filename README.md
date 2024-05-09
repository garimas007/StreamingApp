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



