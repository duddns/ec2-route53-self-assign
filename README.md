# ec2-route53-self-assign



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



## Adding a service
```
$ sudo ln -s update-route53.sh /etc/init.d/update-route53
$ sudo update-rc.d update-route53 defaults
```
* 이 경우 서비스 실행하는 user 계정에 aws configure 를 진행해야 합니다.


## References
http://docs.aws.amazon.com/cli/latest/reference/route53/change-resource-record-sets.html
