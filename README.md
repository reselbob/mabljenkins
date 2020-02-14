# mablJenkins
A version of the Jenkins container that includes often used utilities and programs such as node, npm, curl, etc.

Also, this Jenkins container includes the `mabl` command line tool. `mablJenkins` allows you to run Docker in a Pipeline stage of a shell exec task.

## Pre-installation

We'll run this project under [Katacoda](katacoda.com).

**Step 1:** Go to the Ubuntu playground in Katacoda

`https://katacoda.com/courses/ubuntu/playground`

**Step 2:** Clone the repository code

`git clone https://github.com/reselbob/mabljenkins.git`

**Step 3:** Go to the project's directory

`cd mabljenkins`


## Installation

**Step 1:** Build the container image locally.

`docker build -t mabljenkins:v1 .`

**Step 2:** Create the container based on the local Docker image, making the host's version of docker available to the Jenkins container

`docker run --name jenkins -d -p 80:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock -v /usr/bin/docker:/usr/bin/docker mabljenkins:v1`

**Step 3:** Get the initial login ID that you'll need to access Jenkins

`docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword`

You'll output that is similar to, but not exactly like the following:

`4b36a89b91a24c51a5d4042433c013e2`

**Step 4:** Confirm the `docker` command works from inside the Jenkins container

`docker exec -it jenkins docker ps`

**Step 5:** Go to your browser and spin the Jenkins site up at `localhost:80`.

The first time you go the site you'll be asked to enter the login ID you generated above in Step 3.
Then you'll need to create some login credentials.

**Step 6:** Once you get mablJenkins up and running as a Docker container, continue on to instructions
found [here](create-pipeline.md) to learn how to create a Jenkins Pipeline job.
