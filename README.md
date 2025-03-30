# TraduSquare's Website Backend Server 
![example workflow](https://github.com/TraduSquare/webpage-backend/actions/workflows/generate-artifacts.yml/badge.svg) [![codecov](https://codecov.io/gh/TraduSquare/webpage-backend/graph/badge.svg?token=NU9I3GRMA4)](https://codecov.io/gh/TraduSquare/webpage-backend)

## Development Roadmap

## Usage
This project runs Hanami Framework over Ruby 3.3.7.
### Prerrequisites

#### Dependencies
- Ruby 3.3.X
- Bundler (Dependant on Ruby)
- Gem (Dependant on Ruby)
- Postgres 16.4 Database
- Docker and Docker Compose **(optional)**

You can install the dependencies manually in your system, but for simplicity and ease of use, it is recommended to use the docker-compose script included in this repo. Both appraches will be in this README anyway.
#### 1. Install Docker Desktop (automatic method)
This is the recommended method as the Docker image and scripts included in this repo will always be updated and ready to automatically launch all the depencies and processes the server needs.

Whether you use Windows or Linux, you should always install Docker Desktop as it automatically installs Docker, Docker compose and runs the post-installation scripts included to make it work as intended.
Installing Docker components is not recommended, thus this document will not follow that approach. 
##### Install Docker Desktop in Windows
Follow the steps in the [DOCKER Windows Setup Documentation](https://docs.docker.com/desktop/setup/install/windows-install/) to get Docker Desktop installed in your system.

1. Activate Hyper-V 
2. Download the Docker Desktop installer .exe for x64 or ARM systems depending on your machine.
3. Open the .exe and follow the instructions.

##### Install Docker Desktop in Linux
Follow the steps in the [DOCKER Linux Setup Documentation](https://docs.docker.com/desktop/setup/install/linux/) to get Docker Desktop installed in your system.
The process may vary depending of your distro, but it should follow this rough steps: 

1. Check if KVM is supported or active in your system and activate it.
2. Download and install Docker Desktop from your distro's package repository (apt, pamac, yum, etc.)
3. Launch Docker Desktop and start 'Hello World' machine to check it's working properly.

#### 1a. Launch Docker Compose script
Open a Terminal (CMD in Windows) in the 
#### 2. Install dependencies (manual method)
**We strongly advise not to follow this method** as for future updates, it may be needed to update and install new dependencies manually, opposed to the Docker one. Thus, we will go over these steps quickly.
- Ruby 3.3.x Follow [this link](https://www.ruby-lang.org/es/downloads/) and choose your version depending on your OS (Windows will use RubyInstaller and Linux RBenv)
- Postgres 16 (Follow this [link for Windows](https://www.postgresql.org/download/windows/) and [this one for Linux](https://www.postgresql.org/download/linux/)

##### 2a. Create Postgres Databases
Follow [this link for instructions](https://www.postgresql.org/docs/current/sql-createdatabase.html) on how to create Postgres Databases. Two databases must be created, backend_development and backend_test, one for each development environment.
### 3 Download the repo
1. Clone this repository in your machine.
 (In the future, every version merged in the development branch will generates artifacts that can be downloaded directly from github. Additionally, master branch's merges will generate new stable versions with the same purpose.)
### 4. Create .env and .env.test files
These files must include a line specificating the database used for each environment.
EX: ```DATABASE_URL=postgres://{user}:{password}@db:5432/{database}```
Change user, password and database variables with your database data.
### 5. Run the server
1. Go to the cloned folder in your system.
2. Open a terminal (CMD in Windows)
3. Run the following commands:
   3.1. **If you followed the recommended Docker method**:
     ```docker compose up```. This will launch all the dependencies, migrations and the server itself.
   3.2. If you installed the dependencies manually:
     1. ```bundle install``` (this will install the server dependencies (gems)
     2. ```hanami db migrate``` (this will create the database tables and populate them)
     3. ```hanami server``` 
### Endpoints and API Usage
Once launched, the server will run on ```0.0.0.0:2300``` address and all the REQUESTS must be directed there.
Postman API documentation.
- API Sign Up Endpoint: you get the token
- API Login Endpoint: you login with your generated token
- Every other Endpoint: include the generated token within your request as an 'Authentication' header, otherwise they will return a 403 error.

## Contributing
To contribute follow the [contributing guidelines](CONTRIBUTING.md).

## License

The software is licensed under the terms of the
[MIT license](https://choosealicense.com/licenses/mit/).
