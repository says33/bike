require 'singleton'

class S3AssetService
    include Singleton

    def initialize
        @bucket_region = Rails.application.secrets.aws_region_bucket
        @bucket_name = Rails.application.secrets.aws_name_bucket
    end

    def upload_image_to_s3(file)
        Aws.use_bundled_cert!
        s3 = Aws::S3::Resource.new(region: ENV["AWS_BUCKET_REGION"])
        file_to_upload = s3.bucket(ENV["AWS_BUCKET_NAME"]).object("#{Time.now()}_#{file.original_filename}")
        file_to_upload.upload_file(file.tempfile, acl:'public-read')
        file_to_upload
    end

    def save_s3Asset_info(url_file_s3)
        asset = Asset.new(url_file:url_file_s3)
        asset.save
        asset
    end

end
