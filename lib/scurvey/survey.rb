module Scurvey
  class Survey
    include Virtus.model

    attribute :key, Symbol
    attribute :label, String
    attribute :questions, Array[::Scurvey::Question]

    def initialize(attributes={})
      super(attributes)
      @questions = []
    end

  end
end
