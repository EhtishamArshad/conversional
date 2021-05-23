# Conversional API for invoicing
This project is based on laravel. It is an API based project to generate and retrieve ivoices for Conversional.

## Installation

### Pre-requisites
- Make sure you have composer and laravel installed on your machine

### Setup Database
- Add database connection details in .env file
- Run migrations using following command
``` php artisan migrate ```
- Database will be setup and you can populate the data accordingly
- In case of dummy data, upload conversional.sql into mysql admin. It will setup the dummy database

## Run project
Run the project using ``` php artisan serve```. The project will be served locally at ``` http://127.0.0.1:8000 ```

## Consume APIs
There are following endpoints:
- To save invoice POST request ```http://http://127.0.0.1:8000/api/invoice```
    - Parameters required for request:
    ``` customerId, startDate, endDate```
    - Successful creation of record will return invoice id
- To retreive the invoice GET request ```http://http://127.0.0.1:8000/api/invoice/{id}```

## Screenshots

POST Request:

![ScreenShot-Api](https://user-images.githubusercontent.com/45325795/119270889-62566c00-bc18-11eb-950f-063db932bfa8.jpg)

GET Request:

![api-get](https://user-images.githubusercontent.com/45325795/119270913-85811b80-bc18-11eb-8811-08f21674b2a4.png)
