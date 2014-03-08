module Scurvey
  class AnswerDSL
    def initialize(answer)
      @answer = answer
    end

    def key(key)
      @answer.key = key
    end

    def label(label)
      @answer.label = label
    end
  end
end
