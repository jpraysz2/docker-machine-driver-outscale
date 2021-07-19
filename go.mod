module github.com/acabrele/docker-machine-driver-outscale

go 1.16

replace github.com/docker/docker => github.com/moby/moby v1.4.2-0.20170731201646-1009e6a40b29

replace golang.org/x/sys => golang.org/x/sys v0.0.0-20200826173525-f9321e4c35a6 //mac fix https://github.com/ory/dockertest/issues/212#issuecomment-685167115

//replace github.com/docker/machine => github.com/rancher/machine v0.13.0

replace github.com/codegangsta/cli => github.com/urfave/cli v1.22.5

require (
	github.com/aws/aws-sdk-go v1.38.4 // indirect
	github.com/docker/docker v20.10.5+incompatible // indirect
	github.com/docker/machine v0.16.2 // indirect
	github.com/urfave/cli v1.22.5 // indirect
)
