require_relative 'answer'

class Scurvey
  class Question
    include Virtus.model

    attribute :answers, Array[::Scurvey::Answer]
    attribute :key, Symbol
    attribute :label, String

    def initialize(attributes)
      super(attributes)
      @answers = []
    end

    def answer(key, attributes={})
      a = ::Scurvey::Answer.new(attributes.merge({key: key}))
      @answers << a
    end

    def method_missing(method_name, *args, &block)
      raise "No such method #{method_name} on #{self.class.name}."
    end
  end
end
