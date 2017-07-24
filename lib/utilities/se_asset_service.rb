require 'singleton'

class S3AssetService
    include Singleton

    def initialize
        @bucket_region = Rails.application.secrets.aws_region_bucket
        @bucket_name = Rails.application.secrets.aws_name_bucket
    end

    def upload_image_to_s3(params)
        Aws.use_bundled_cert!
        s3 = Aws::S3::Resource.new(region: @bucket_region)
        file_to_upload = s3.bucket(@bucket_name).object("#{Time.now()}_#{params['file'].original_filename}")
        file_to_upload.upload_file(params['file'].tempfile, acl:'public-read')
        file_to_upload
    end

    def save_s3Asset_info(url_file_s3)
        Asset.new(url_file:url_file_s3).save
    end

end
