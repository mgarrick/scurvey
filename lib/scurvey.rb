require 'virtus'
require_relative 'scurvey/survey'
require_relative 'scurvey/survey_dsl'
#require_relative 'scurvey/question'
#require_relative 'scurvey/answer'

class Scurvey
  include Virtus.model

  attribute :survey, ::Scurvey::Survey
  #attribute :context, ::Scurvey::Context

  def self.open(filename)
    dsl = new
    dsl.instance_eval(File.read(filename))
    dsl.context
  end

  def self.load(string)
    dsl = new
    dsl.instance_eval(string)
    dsl.context
  end

  def self.start
    survey = ::Scurvey::Survey.new
    yield ::Scurvey::SurveyDSL.new(survey)
    survey
  end

  def method_missing(method_name, *args, &block)
    raise "No such method #{method_name} on #{self.class.name}."
  end
end
