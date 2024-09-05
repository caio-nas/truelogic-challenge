# Truelogic Code Challenge

## Prerequisites

Make sure you have the following installed:
- Running locally: Ruby with Bundler
- Running on container: Docker/Docker Compose

## How to Run the Project

### 1. Running from the command line

1. Install the dependencies:
    ```bash
    bundle install
    ```
2. Run the script:
    ```bash
    ./bin/smallest_absolute_goal_difference
    ./bin/smallest_temperature_spread_day
    ```

### 2. Running with Docker

1. Build the Docker image:
    ```bash
    docker build -t truelogic .
    ```
2. Run the Docker container:
    ```bash
    docker run --rm truelogic smallest_temperature_spread_day
    docker run --rm truelogic smallest_absolute_goal_difference
    ```

### 3. Running with Docker Compose
  ```
  docker-compose run --rm app smallest_temperature_spread_day
  docker-compose run --rm app smallest_absolute_goal_difference
  ```

## Additional Information

- **Data Files:** By default, the scripts rely on `soccer.dat` and `weather.dat` files located in the `/data` directory. You can pass an alternative file path as a command line parameter.

- **Tests:** Unit tests are located in the `/spec/service` directory and can be run using RSpec.
