class Scurvey
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
  end
end
