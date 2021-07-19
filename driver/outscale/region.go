package outscale

import (
	"errors"
)

type region struct {
	AmiId string
}

// Ubuntu 16.04 LTS 20180228.1 hvm:ebs-ssd (amd64)
// See https://cloud-images.ubuntu.com/locator/ec2/
var regionDetails map[string]*region = map[string]*region{
	"eu-west-2":       {"ami-ff46a298"},
	"us-east-2":       {"ami-b9daeddc"},
	"us-west-1":       {"ami-264c4646"},
	"ap-northeast-1":  {"ami-bcb7f6da"},
	"custom-endpoint": {""},
}

func awsRegionsList() []string {
	var list []string

	for k := range regionDetails {
		list = append(list, k)
	}

	return list
}

func validateAwsRegion(region string) (string, error) {
	for _, v := range awsRegionsList() {
		if v == region {
			return region, nil
		}
	}

	return "", errors.New("Invalid region specified")
}
