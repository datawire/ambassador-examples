# Ambassador Examples

A repository that contains pre-canned Ambassador examples that can be used as either straight recipes for your own use cases, rapid prototyping, or building issue reproducers.

# Warning (from Phil)

This is **very** rough stuff. I use this as my test harness for Ambassador issue's but it is no way a formal setup with tests or really any procedure to ensure it always works. I just sort of know how it is assembled and how to use it. I'd like to make it a more formal tool and project at some point but I have not yet found the time to do that.

# Setup

1. **Prerequisites** You need a cluster with `cluster-admin` permissions.
2. Apply the two namespaces that are used throughout all the examples.

    ```bash
    kubectl apply -f namespaces.yaml
    ```
    
3. Deploy Ambassador:

    ```bash
    cd ambassador
    forge --profile=sandbox0 deploy
    ```
    
4. Deploy one or more of the Examples

    ```bash
    cd http-loadbalance
    forge --profile=sandbox0 deploy
    ```
    
5. You will likely need to read the Ambassador mapping data in the Kubernetes manifests to know what to communicate with. 

# Get the LoadBalancer

`./ambassador-lb.sh`

# Get a shell to one of the Ambassador contains

`./ambassador-shell.sh`

# Connect to the UI

`./ambassador-ui.sh`
