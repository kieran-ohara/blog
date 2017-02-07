from troposphere import Template
import troposphere.s3 as s3

template = Template()

bucketNames = ['kieranbamforth.me', 'www.kieranbamforth.me']

for index, bucketName in enumerate(bucketNames):
    resourceName = 'bucket{}'.format(index)
    bucket = s3.Bucket(resourceName)
    bucket.BucketName = bucketName
    template.add_resource(bucket)

print(template.to_json())
