# frozen_string_literal: true

require_relative "pyser/version"
require_relative "pyser/client"

module Pyser
  class Error < StandardError; end

  def self.check
    puts "> pyser sdk installed sucessfully.."
    # resume = File.open('./supriya-resume.pdf')
    # res = HttpClient.post(url: "#{ENV['RESUME_PARSER_API']}/upload_resume", multipart: true, body: { 'pdf': resume, headers: HttpClient.headers})
     puts "> "+ Rails.env
  end

  def self.parse(payload: '', token: '')
    # res = HttpClient.post(url: "#{ENV['RESUME_PARSER_API']}/upload_resume", multipart: true, body: { 'pdf': resume, headers: HttpClient.headers})
    begin
      res = Pyser::Client::test()
    # res = HttpClient.post(url: "#{ENV['RESUME_PARSER_API']}/upload_resume", multipart: true, body: { 'pdf': resume, headers: HttpClient.headers})
    rescue => error
      Rails.logger.debug error
      Sentry.capture_message("Resume parsing failed", error)
    end
  end
end
