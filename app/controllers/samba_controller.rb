# frozen_string_literal: true

class SambaController < ApplicationController
  before_action :set_ls_path, on: %i[ls download]
  include ActionController::Live

  def ls
    @ls = samba.ls(@ls_path.join('/') + '/*')
  end

  def download
    filename = @ls_path.last
    send_file_headers!(
      disposition: 'attachment',
      filename: filename
    )

    tempfile = Tempfile.new(['', filename])
    sambal.get(@ls_path.join('/'), tempfile)
    response.stream.write(chunk)
  ensure
    response.stream.close
  end

  private

  def set_ls_path
    @ls_path = params[:ls_path].to_s.split(',')
  end

  def samba
    Sambala.new(
      domain: 'WORKGROUP',
      host: '192.168.1.2',
      share: 'public',
      user: 'guest',
      password: '',
      threads: 1
    )
  end
end
