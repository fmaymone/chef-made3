Paperclip.configure do |config|
    puts "Config do paperclip"
    # Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
    # Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
    # Paperclip::Attachment.default_options[:s3_host_alias] = 's3-us-west-2.amazonaws.com'
     Paperclip::Attachment.default_options[:s3_host_name] = 's3-sa-east-1.amazonaws.com'
end