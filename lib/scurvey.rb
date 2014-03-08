require 'virtus'
require 'jbuilder'

require_relative 'scurvey/submission'
require_relative 'scurvey/export/json'
require_relative 'scurvey/answer'
require_relative 'scurvey/answer_dsl'
require_relative 'scurvey/question'
require_relative 'scurvey/question_dsl'
require_relative 'scurvey/survey_dsl'
require_relative 'scurvey/survey'

module Scurvey
  class << self

    def start(key=nil, attributes={})
      survey = ::Scurvey::Survey.new(attributes.merge(key: key))
      yield ::Scurvey::SurveyDSL.new(survey) if block_given?
      survey
    end
  end
end
