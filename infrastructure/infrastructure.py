from troposphere import Template, GetAtt, Ref
from troposphere.cloudfront import Distribution, DistributionConfig
from troposphere.cloudfront import ForwardedValues
from troposphere.cloudfront import Origin, DefaultCacheBehavior
from troposphere.cloudfront import S3Origin
from troposphere.cloudfront import ViewerCertificate
from troposphere.cloudfront import DefaultCacheBehavior, ForwardedValues

import troposphere.s3 as s3
import troposphere.route53 as r53

template = Template()

content_bucket = template.add_resource(s3.Bucket(
    'bucket1',
    BucketName='www.kieranbamforth.me',
    WebsiteConfiguration=s3.WebsiteConfiguration(
        IndexDocument='index.html',
        ErrorDocument='blog/404.html'
        )
    ))

content_bucket_poilcy = template.add_resource(s3.BucketPolicy(
    'bucketPolicy1',
    Bucket='www.kieranbamforth.me',
    PolicyDocument={
        'Version': '2012-10-17',
        'Statement': [{
            'Sid': 'Allow Public Access to All Objects',
            'Effect': 'Allow',
            'Principal': '*',
            'Action': 's3:GetObject',
            'Resource': 'arn:aws:s3:::www.kieranbamforth.me/*'
            }]
        }
    ))

redirect_bucket = template.add_resource(s3.Bucket(
    'bucket0',
    BucketName='kieranbamforth.me',
    WebsiteConfiguration=s3.WebsiteConfiguration(
        RedirectAllRequestsTo=s3.RedirectAllRequestsTo(
            HostName='www.kieranbamforth.me',
            Protocol='https'
            )
        )
    ))

redirect_record_set = template.add_resource(r53.RecordSetType(
    'recordSet0',
    AliasTarget=r53.AliasTarget(
        HostedZoneId='Z1BKCTXD74EZPE',
        DNSName='s3-website-eu-west-1.amazonaws.com'),
    HostedZoneName='kieranbamforth.me.',
    Name='kieranbamforth.me.',
    Type='A'
    ))

cloudfront_dist = template.add_resource(Distribution(
    'cloudfrontDistribution',
    DistributionConfig=DistributionConfig(
        Aliases=['www.kieranbamforth.me'],
        Origins=[Origin(
            Id='S3Origin',
            DomainName=GetAtt(content_bucket, 'DomainName'),
            S3OriginConfig=S3Origin())],
        DefaultCacheBehavior=DefaultCacheBehavior(
            TargetOriginId='S3Origin',
            ViewerProtocolPolicy='redirect-to-https',
            ForwardedValues=ForwardedValues(QueryString=False),
            ),
        Enabled=True,
        HttpVersion='http2',
        ViewerCertificate=ViewerCertificate(
            AcmCertificateArn='arn:aws:acm:us-east-1:855277617897:certificate/8b0604e4-b83b-419c-bc64-d06849c6b5ce',
            SslSupportMethod='sni-only'
            )
        )
    ))

cloudfront_record_set = template.add_resource(r53.RecordSetType(
    'recordSetWww',
    AliasTarget=r53.AliasTarget(
        HostedZoneId='Z2FDTNDATAQYW2',
        DNSName=GetAtt(cloudfront_dist, 'DomainName')),
    HostedZoneName='kieranbamforth.me.',
    Name='www.kieranbamforth.me.',
    Type='A'
    ))

print(template.to_json())
