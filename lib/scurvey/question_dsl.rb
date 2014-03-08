module Scurvey
  class QuestionDSL
    def initialize(question)
      @question = question
    end

    def key(key)
      @question.key = key
    end

    def label(label)
      @question.label = label
    end

    def answer(key=nil, attributes={}, &block)
      answer = ::Scurvey::Answer.new(attributes.merge(key: key))
      @question.answers << answer
      yield ::Scurvey::AnswerDSL.new(answer) if block_given?
    end

    def method_missing(method_name, *args, &block)
      raise "No such method #{method_name} on #{self.class.name}."
    end
  end
end
