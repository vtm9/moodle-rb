require 'logger'

module MoodleRb
  def self.new(token, url, logger = nil)
    @@logger = logger || ::Logger.new(STDOUT)
    Client.new(token, url)
  end

  def self.logger
    @@logger
  end
end
require 'httparty'
require 'moodle_rb/version'
require 'moodle_rb/utility'
require 'moodle_rb/error'
require 'moodle_rb/client'
require 'moodle_rb/courses'
require 'moodle_rb/categories'
require 'moodle_rb/enrolments'
require 'moodle_rb/grades'
require 'moodle_rb/users'
