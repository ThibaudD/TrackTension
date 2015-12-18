TrackTension
===================

#### What is TrackTension?
TrackTension is a web app that help you to track your blood pressure.

#### Stack
It is a Rails application with a Postgres database.

----------


How to install
-------------
### With Docker
clone the repository
```
git clone git@github.com:ThibaudD/TrackTension.git
cd TrackTension
```
build the docker image and launch the rails app and the Postgres database with docker-compose
```
docker-compose build
docker-compose up
```
open a new terminal and create and migrate the database
```
docker-compose run web rake db:create
docker-compose run web rake db:migrate
```
Now your application should be working and you could access it on your docker host on the port 3000
If you want to launch guard
```
docker-compose run web guard --force-polling
```


----------

License
-------------

Copyright 2015 TrackTension.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
