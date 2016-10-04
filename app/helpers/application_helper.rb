# application_helper.rb

module ApplicationHelper
  VERSION = 0.1

  def get_video_content_type media
    media.video_info.variants.first.attrs[:content_type]
  end

  def get_video_url media
    media.video_info.variants.first.attrs[:url]
  end

  def get_image_url media
    media.attrs[:media_url]
  end

  def get_mime_type url
    media = open url
    media.content_type
  end
end

