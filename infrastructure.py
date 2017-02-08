from troposphere import Template
import troposphere.s3 as s3

template = Template()

bucketNames = ['kieranbamforth.me', 'www.kieranbamforth.me']

for index, bucketName in enumerate(bucketNames):
    bucketResourceName = 'bucket{}'.format(index)
    bucket = s3.Bucket(bucketResourceName)
    bucket.BucketName = bucketName

    template.add_resource(bucket)

    bucketPolicyDocument = {
            "Version": "2012-10-17",
            "Statement": [{
                "Sid": "Allow Public Access to All Objects",
                "Effect": "Allow",
                "Principal": "*",
                "Action": "s3:GetObject",
                "Resource": "arn:aws:s3:::{}/*".format(bucketName)
                }]
            }

    bucketPolicyResourceName = 'bucketPolicy{}'.format(index)
    bucketPolicy = s3.BucketPolicy(bucketPolicyResourceName)
    bucketPolicy.Bucket = bucketName
    bucketPolicy.PolicyDocument = bucketPolicyDocument

    template.add_resource(bucketPolicy)

print(template.to_json())
