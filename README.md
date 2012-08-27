Tropo-webapi-example
====================

This is a Sinatra app that shows how to use [Tropo WebAPI](https://www.tropo.com/docs/webapi/new_tropo_web_api_overview.htm) to track two way SMS conversations. The Tropo Web API is a web-service API that lets you build communications applications that run on your servers and handles the Tropo cloud using JSON over HTTP.

This example requests information from the caller and waits for a response via SMS.

## Motivation

"Tropo includes an “ask” method, which allows you to ask a question and wait for a response.  On a voice call, the user is actually on the phone and typically responds quickly; with SMS, they might receive your text with the question but wait to respond until they have the free time.  If your ask has a timeout of 30 seconds, and your user responds in a couple hours, how do you manage it? The absolute maximum timeout you can set is 2 hours – what if they respond the next day?"

In the documentation I found an example that handles two way SMS conversation using the [Scripting feature](https://www.tropo.com/docs/scripting/overview.htm) but I needed to use the [WebAPI](https://www.tropo.com/docs/webapi/new_tropo_web_api_overview.htm).


## Usage

* Upload you code (or this example) to a server, for example Heroku.
* Configure your tropo-app with the URL that handles the communication with tropo in your app.In this example is <your-site-address>/indexManual.json

*TROUBLESHOOTING:* If Tropo doesn't work outside the US, you may contact the support team which is great!