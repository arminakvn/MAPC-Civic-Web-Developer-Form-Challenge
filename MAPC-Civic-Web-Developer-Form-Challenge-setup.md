###MAPC-Civic-Web-Developer-Form-Challenge Setup Instructions
#####Application Files

Unzip the folder "MAPC-Civic-Web-Developer-Form-Challenge" to a location on your machine.

#####Environment Setup for Mac

This application uses Docker and containers technology. If you don't already have Docker installed, you can do so using one of the following:

- [Docker for Mac](https://docs.docker.com/docker-for-mac/) 
- [Docker Toolbox](https://docs.docker.com/toolbox/toolbox_install_mac/)

Further instructions on how to test if Docker is correctly installed and troubleshooting instructions are available on Docker's website.


#####Environment Setup for Windows

This application uses Docker and containers technology. If you don't already have Docker installed, you can do so using one of the following:

- [Docker for Windows](https://docs.docker.com/docker-for-windows/) (for Windows 10) 
- [Docker Toolbox](https://docs.docker.com/toolbox/toolbox_install_windows/) (for Windows 8.1 or earlier) 

Further instructions on how to test if Docker is correctly installed and troubleshooting instructions are available on Docker's website.

#####Running the Project from the Docker Quickstart Terminal

Docker utilizes a special bash terminal called the Quickstart Terminal for command inputs. Instructions for using the Docker Quickstart Terminal are included in Docker's online installation instructions. To setup MAPC-Civic-Web-Developer-Form-Challenge application open the Quickstart Terminal and change the directory to the location of the unzipped folder MAPC-Civic-Web-Developer-Form-Challenge is located and then into the MAPC-Civic-Web-Developer-Form-Challenge folder using:

```
cd MAPC-Civic-Web-Developer-Form-Challenge

```

Use the following command to build and run the application for the localhost (this might take a few minutes since it will fetch resources from the repository):

```
docker-compose up -d --build
```

Now that the application is built and served to the localhost, you can check to make sure everything is working with:

```
docker-compose ps
```

Ensure that the "State" of each service is set to "Up".


This should complete the setup. If you installed using Docker for Mac or Windows (Windows 10), the MAPC-Civic-Web-Developer-Form-Challenge application is accessible at `localhost` on your browser. If you're using the Docker Toolbox (Mac or Windows 8.1 or earlier), you will need to run `docker-machine ip default` in the Quickstart Terminal to return the proper IP address which you can then navigate to using your browser.


If you have any issues or questions with the installation, please contact Armin Akhavan (<armin.akhavan@gmail.com>).
