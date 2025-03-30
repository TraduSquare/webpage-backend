# TraduSquare's Website Backend Server 
![example workflow](https://github.com/TraduSquare/webpage-backend/actions/workflows/generate-artifacts.yml/badge.svg) [![codecov](https://codecov.io/gh/TraduSquare/webpage-backend/graph/badge.svg?token=NU9I3GRMA4)](https://codecov.io/gh/TraduSquare/webpage-backend)

## Development Roadmap

## Usage
This project runs Hanami Framework over Ruby 3.3.7.
### Prerrequisites

#### Dependencies
- Docker and Docker Compose
  - Ruby 3.3.X
  - Bundler (Dependant on Ruby)
  - Gem (Dependant on Ruby)
  - Postgres 16.4 Database

You can install the dependencies manually in your system, but for simplicity and ease of use, it is recommended to use the docker-compose script included in this repo. Both appraches will be in this README anyway.
#### 1. Install Docker Desktop (automatic method)
This is the recommended method as the Docker image and scripts included in this repo will always be updated and ready to automatically launch all the depencies and processes the server needs.

Whether you use Windows or Linux, you should always install Docker Desktop as it automatically installs Docker, Docker compose and runs the post-installation scripts included to make it work as intended.
Installing Docker components is not recommended, thus this document will not follow that approach. 
##### 1. Install Docker Desktop in Windows
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

### 2. Download the repo
1. Clone this repository in your machine.
 (In the future, every version merged in the development branch will generates artifacts that can be downloaded directly from github. Additionally, master branch's merges will generate new stable versions with the same purpose.)
### 3. Create .env and .env.test files
These files must include a line specificating the database used for each environment.
EX: ```DATABASE_URL=postgres://{user}:{password}@db:5432/{database}```
Change user, password and database variables with your database data.
### 4. Run the server
1. Go to the cloned folder in your system.
2. Open a terminal (CMD in Windows)
3. Run the following command:
   ```docker compose up```. This will launch all the dependencies, migrations and the server itself.

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
