module Scurvey
  class SurveyDSL
    def initialize(survey)
      @survey = survey
    end

    def key(key)
      @survey.key = key
    end

    def label(label)
      @survey.label = label
    end

    def question(key=nil, attributes={}, &block)
      question = ::Scurvey::Question.new(attributes.merge(key: key))
      @survey.questions << question
      yield ::Scurvey::QuestionDSL.new(question) if block_given?
    end

    def method_missing(method_name, *args, &block)
      raise "No such method #{method_name} on #{self.class.name}."
    end
  end
end
