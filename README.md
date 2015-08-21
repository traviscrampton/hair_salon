### Hair Salon

### IN PSQL:
### CREATE DATABASE hair_salon;
### CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
### CREATE TABLE clients (id serial PRIMARY KEY, title varchar, stylist_id);
### CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;

#### By Travis Crampton

## Description

Welcome to the hair salon, this application allows you to enter in a stylists and add clients to specific stylists. Users are able to follow the links to add stylists as well as add clients once they have entered a stylists page. The stylists and clients a like are stored in a SQL database with the table set up in the PSQL section of this readme.md

## Setup

* enter postgres
* enter psql
* follow psql instructions as listed above
* bundle gems
* open in localhost:4567 or relevant server

## Technologies Used

Used Ruby, Sinatra, capybara, postgres and psql to set up the webpage.  

### LEGAL

Copyright (c) 2015 **_{Travis Crampton}_**

This software is licensed under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
