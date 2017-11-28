# unicorn_api

This is our API Proxy code for use by trusted Unicorn Rentals partners, and less trusted DevOps teams. Its purpose is to proxy API calls to our backend. Every 4 minutes it uses a different auth secret to auth to the backend, and to validate the result with caller. Currently the auth is updated by a gitpush every 4 minutes.

## Architecture

Below was/is the proposed architecture for deploying this application. We have partially fulfilled the design in our MVP deployment.

![AWS Architecture](https://s3.amazonaws.com/gdengine-assets-staging.us-east-1/modules/casual_infrastructure_causes_disasters/player-assets/architecture.png)


## Getting Started

If you want to locally test etc:
* Have python 2.7

```
pip install -r requirements.txt
python app.py
```

## Tests
```
python tests_app.py -v
```

Or can manually test with cURL, httpie or a browser.

## Deployment

Configure AWS Parameter Store BACKEND_API value.

Then deploy how suits you, but included is a Dockerfile if you want to use Docker, and an appspec.yml for CodeDeploy.

```
docker build -t unicorn_api .
docker run unicorn_api -p 5000:5000
```

Optionally have AWS xray deployed (executable is in this repo):
```
chmod +x ./xray && nohup ./xray &
```

And have a default AWS region set, either via environment variable, or aws configure.



## Built With
Python  
Flask  
flask_restful  
Requests
watchtower
