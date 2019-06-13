# Rails Voicemail Demo with the Nexmo Voice API

This is a voicemail demo app powered by Rails and the Nexmo Voice API. Users call the Nexmo provisioned phone number and can leave a voicemail recording. All recordings are saved and can be viewed and listened to by visiting the website.

## Requirements

* A [Nexmo account](https://dashboard.nexmo.com/sign-up)
* Ruby on Rails
* [ngrok](https://ngrok.io)

## Installation

* Clone this repository
* Provision a Nexmo virtual number from the Nexmo dashboard
* Create a Nexmo application from the Nexmo dashboard
* Link your virtual number to your application in the Nexmo dashboard
* Start up the Rails server
* Make your server externally accessible with ngrok

## Usage

* Dial your phone number and leave a voicemail
* Access your website by visiting `http://localhost:3000/` and click on `Click here to listen` to hear your recording

## License

This application is under the [MIT License](LICENSE)