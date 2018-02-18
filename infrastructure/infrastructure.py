from troposphere import Template, GetAtt, Ref
import troposphere.s3 as s3
import troposphere.route53 as r53

template = Template()

bucketNames = ['kieranbamforth.me', 'www.kieranbamforth.me']
hostedZoneId = 'Z36PFUEKT1FWSA'

for index, bucketName in enumerate(bucketNames):
    bucketWebsiteConfiguration = s3.WebsiteConfiguration()
    if index == 0:
        redirect = s3.RedirectAllRequestsTo()
        redirect.HostName = Ref('bucket1')
        bucketWebsiteConfiguration.RedirectAllRequestsTo = redirect
    elif index == 1:
        bucketWebsiteConfiguration.IndexDocument = 'index.html'
        bucketWebsiteConfiguration.ErrorDocument = 'blog/404.html'

    bucketResourceName = 'bucket{}'.format(index)
    bucket = s3.Bucket(bucketResourceName)
    bucket.BucketName = bucketName
    bucket.WebsiteConfiguration = bucketWebsiteConfiguration
    template.add_resource(bucket)

    if index == 1:
        bucketPolicyDocument = {
                'Version': '2012-10-17',
                'Statement': [{
                    'Sid': 'Allow Public Access to All Objects',
                    'Effect': 'Allow',
                    'Principal': '*',
                    'Action': 's3:GetObject',
                    'Resource': 'arn:aws:s3:::{}/*'.format(bucketName)
                    }]
                }

        bucketPolicyResourceName = 'bucketPolicy{}'.format(index)
        bucketPolicy = s3.BucketPolicy(bucketPolicyResourceName)
        bucketPolicy.Bucket = bucketName
        bucketPolicy.PolicyDocument = bucketPolicyDocument

        template.add_resource(bucketPolicy)

    aliasTarget = r53.AliasTarget()
    aliasTarget.HostedZoneId = 'Z1BKCTXD74EZPE'
    aliasTarget.DNSName = 's3-website-eu-west-1.amazonaws.com'

    recordSetResourceName = 'recordSet{}'.format(index)
    recordSet = r53.RecordSetType(recordSetResourceName)
    recordSet.AliasTarget = aliasTarget
    recordSet.HostedZoneId = hostedZoneId
    recordSet.Name = bucketName + '.'
    recordSet.Type = 'A'

    template.add_resource(recordSet)

print(template.to_json())
