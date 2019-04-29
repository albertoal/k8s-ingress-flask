# Sample Flask app using Kubernetes Ingress controller

## Usage

### Running locally

Just install the requirements and run the app

    cd webapp/
    pip install -r requirements.txt
    flask run
    curl localhost:5000

### Running on Docker

You can use the already built docker image `albertoal/flask_webapp` or build your own then run it.

From the root dir:

    docker build -t myflask_app .
    docker run -it --rm -p 5000:5000 myflask_app
    curl localhost:5000

### Running on Minikube

For Minikube I created an Ingress controller in order to get external access to the service. This example requires the Minikube ingress addon enabled
If you are deploying the manifest to a different Kubernetes cluster, check out the different [Ingress Controllers](https://kubernetes.io/docs/concepts/services-networking/ingress/#ingress-controllers) available.

    minikube start
    minikube addons enable ingress
    kubectl apply -f kubernetes.yaml
    minikube ip
    > 192.168.20.100
    curl 192.168.20.100/ready

#### Envoy

I wanted to test Envoy proxy sidecar with this app. This is available on `envoy/envoy.yaml`.
Note that this doesn't implement an Envoy proxy ingress gateway, just the proxy sidecar.
