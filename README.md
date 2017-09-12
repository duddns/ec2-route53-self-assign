# ec2-route53-self-assign


## example usage
relate https://github.com/tosslab/aws_instance_scheduler
* ec2 start 시 변경된 IP 를 Route53 에 자동으로 연결



## Create IAM user
```
AmazonRoute53DomainsFullAccess
AmazonRoute53FullAccess
```


## Install python and the AWS client tools
ubuntu example
```
$ sudo apt-get install python-pip
$ sudo pip install -U pip
$ sudo pip install awscli
```



## Change user
this example use root.
```
sudo su - 
```



## Config aws
```
$ aws configure --profile assign-ec2-route53
AWS Access Key ID [None]: -your-aws-key-id
AWS Secret Access Key [None]: -your-aws-access-key
Default region name [None]: -your-region-name
Default output format [None]:
```


## Edit source
```
$ vi update-route53-A.json
replace {CHANGE_DOMAIN} 
```
```
$ vi update-route53.sh
replace {CHANGE_HOSTED_ZONE_ID} 
```


## Make it excutable
```
$ chmod +x update-route53.sh
```


## Adding a service
```
$ sudo ln -s /root/update-route53.sh /etc/init.d/update-route53
$ sudo update-rc.d update-route53 defaults
```



## References
http://docs.aws.amazon.com/cli/latest/reference/route53/change-resource-record-sets.html
