# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
# Mime::Type.register_alias "text/html", :iphone


# vnd: is vendor mime type
# v1 : api version
Mime::Type.register 'application/vnd.apitemplate.com.v1+json', :json_v1
Mime::Type.register 'application/vnd.apitemplate.com.v2+json', :json_v2
