# Login Project

This project aims to automate the login functionality of a simple login web application https://seleniumbase.io/realworld/login
using robot framework and playwright

## Getting Started

1. Install Robot Framework:
   - [Robot Framework documentation](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#installation-instructions).

2. Install Playwright:
   - [Playwright documentation](https://playwright.dev/python/docs/intro#installation).
3. Install Dependencies
   -  pip install python-dotenv

3. Set up the project:
   - Clone this repository.

## Running the Tests

1. Configure the test environment:
   - copy .env_example to .env_test and change the value.
   - Host url is https://seleniumbase.io/realworld
   - Credentials can be obtained https://seleniumbase.io/realworld/signup.

2. Run the tests:
   - Open a terminal or command prompt.
   - Navigate to the project directory.
   - Run the tests using the command `robot -d results -v ENV:test  tests/`.

## Test Structure

The directory structure is as follows:

- `tests`: Contains the test cases
    - `login.robot`: Contains the test cases for the login functionality.
- `resources`: Contains the test keywords, locators, variables.
      - `keywords/login.resource`: Contains the keywords for logging in and verifying error messages.
      - `locators/login_page.resource`: Contains the elements locator of login page
      - `variables/env_variable.py`: Contains environment configuration variables

