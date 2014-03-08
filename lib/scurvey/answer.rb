module Scurvey
  class Answer
    include Virtus.model

    attribute :key, Symbol
    attribute :label, String
  end
end
