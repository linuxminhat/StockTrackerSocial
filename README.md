# A Stock Tracker Social Media App
View a live demo at: https://stock-tracker-linh.herokuapp.com

## Description
A social media app to keep track of your stocks in your portfolio and add friends and view their portfolios

## Written in Ruby on Rails
* Ruby version 2.2.3
* gem stock_quote 1.5.2
* gem devise

Include Dockerfile to run the app locally
- build docker image and run it: 
```
git clone https://github.com/linhkikuchi/stock-tracker-social-media.git
cd stock-tracker-social-media
docker build -t ruby-app .
docker run -p 3000:3000 -d ruby-app
```